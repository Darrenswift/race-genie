#!/bin/bash
# GCP Cleanup Script for Race Genie Discord Bot
# WARNING: This script will delete all GCP resources provisioned for this bot.

PROJECT_ID="discord-race-genie"
ZONE="us-central1-a"
REGION="us-central1"
SA_NAME="race-genie-sa"
SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
VM_NAME="race-genie-vm"
BUCKET_NAME="race-genie-deploy-${PROJECT_ID}"
NETWORK_NAME="race-genie-network"
SUBNET_NAME="race-genie-subnet"
ROUTER_NAME="race-genie-router"
NAT_NAME="race-genie-nat"
FIREWALL_RULE="allow-ssh-and-healthcheck"
FIREWALL_RULE_IAP="allow-ssh-via-iap"

echo "⚠️ WARNING: This will permanently delete all GCP resources for Race Genie in project [$PROJECT_ID]!"
read -p "Are you sure you want to proceed? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Teardown aborted."
    exit 0
fi

echo "🏁 Starting GCP Teardown..."

# Set project context
gcloud config set project "$PROJECT_ID"

# 1. Delete VM Instance
if gcloud compute instances describe "$VM_NAME" --zone="$ZONE" &>/dev/null; then
    echo "Deleting VM instance: $VM_NAME..."
    gcloud compute instances delete "$VM_NAME" --zone="$ZONE" --quiet
else
    echo "VM instance $VM_NAME does not exist."
fi

# 2. Delete GCS Deployment Bucket
if gcloud storage buckets describe "gs://${BUCKET_NAME}" &>/dev/null; then
    echo "Deleting deployment bucket and its contents: gs://${BUCKET_NAME}..."
    gcloud storage rm --recursive "gs://${BUCKET_NAME}" --quiet || true
    gcloud storage buckets delete "gs://${BUCKET_NAME}" --quiet || true
else
    echo "Bucket gs://${BUCKET_NAME} does not exist."
fi

# 3. Delete Cloud NAT & Cloud Router
if gcloud compute routers describe "$ROUTER_NAME" --region="$REGION" &>/dev/null; then
    # Check if NAT exists on the router
    if gcloud compute routers describe "$ROUTER_NAME" --region="$REGION" --format="value(nats.name)" | grep -q "$NAT_NAME"; then
        echo "Deleting Cloud NAT: $NAT_NAME..."
        gcloud compute routers nats delete "$NAT_NAME" --router="$ROUTER_NAME" --region="$REGION" --quiet
    fi
    echo "Deleting Cloud Router: $ROUTER_NAME..."
    gcloud compute routers delete "$ROUTER_NAME" --region="$REGION" --quiet
else
    echo "Cloud Router $ROUTER_NAME does not exist."
fi

# 4. Delete Firewall Rules
if gcloud compute firewall-rules describe "$FIREWALL_RULE" &>/dev/null; then
    echo "Deleting Firewall Rule: $FIREWALL_RULE..."
    gcloud compute firewall-rules delete "$FIREWALL_RULE" --quiet
else
    echo "Firewall rule $FIREWALL_RULE does not exist."
fi

if gcloud compute firewall-rules describe "$FIREWALL_RULE_IAP" &>/dev/null; then
    echo "Deleting Firewall Rule: $FIREWALL_RULE_IAP..."
    gcloud compute firewall-rules delete "$FIREWALL_RULE_IAP" --quiet
fi

# 5. Delete Subnet and VPC Network
if gcloud compute networks subnets describe "$SUBNET_NAME" --region="$REGION" &>/dev/null; then
    echo "Deleting Subnet: $SUBNET_NAME..."
    gcloud compute networks subnets delete "$SUBNET_NAME" --region="$REGION" --quiet
else
    echo "Subnet $SUBNET_NAME does not exist."
fi

if gcloud compute networks describe "$NETWORK_NAME" &>/dev/null; then
    echo "Deleting VPC Network: $NETWORK_NAME..."
    gcloud compute networks delete "$NETWORK_NAME" --quiet
else
    echo "VPC Network $NETWORK_NAME does not exist."
fi

# 6. Delete Secrets
delete_secret_if_exists() {
    local secret_name=$1
    if gcloud secrets describe "$secret_name" &>/dev/null; then
        echo "Deleting Secret: $secret_name..."
        gcloud secrets delete "$secret_name" --quiet
    fi
}

delete_secret_if_exists "DISCORD_TOKEN"
delete_secret_if_exists "GEMINI_API_KEY"
delete_secret_if_exists "CLIENT_ID"

# 7. Delete IAM bindings & Service Account
if gcloud iam service-accounts describe "$SA_EMAIL" &>/dev/null; then
    echo "Removing IAM bindings from Service Account..."
    gcloud projects remove-iam-policy-binding "$PROJECT_ID" \
        --member="serviceAccount:${SA_EMAIL}" \
        --role="roles/aiplatform.user" \
        --quiet &>/dev/null || true

    gcloud projects remove-iam-policy-binding "$PROJECT_ID" \
        --member="serviceAccount:${SA_EMAIL}" \
        --role="roles/secretmanager.secretAccessor" \
        --quiet &>/dev/null || true

    gcloud projects remove-iam-policy-binding "$PROJECT_ID" \
        --member="serviceAccount:${SA_EMAIL}" \
        --role="roles/storage.objectViewer" \
        --quiet &>/dev/null || true

    echo "Deleting Service Account: $SA_EMAIL..."
    gcloud iam service-accounts delete "$SA_EMAIL" --quiet
else
    echo "Service Account $SA_EMAIL does not exist."
fi

echo "🎉 GCP resources successfully destroyed!"
