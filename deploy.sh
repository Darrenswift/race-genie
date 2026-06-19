#!/bin/bash
# GCP Auto-Deployment Script for Race Genie Discord Bot
set -e

PROJECT_ID="discord-race-genie"
ZONE="us-central1-a"
REGION="us-central1"
SA_NAME="race-genie-sa"
SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
VM_NAME="race-genie-vm"
BUCKET_NAME="race-genie-deploy-${PROJECT_ID}"

echo "🏁 Starting GCP Deployment for Race Genie..."

# 1. Verify gcloud CLI is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ Error: gcloud CLI is not installed. Please install it before running this script."
    exit 1
fi

# 2. Check for local .env to pull initial credentials
if [ ! -f .env ]; then
    echo "❌ Error: No local .env file found. We need it to populate Secret Manager credentials."
    exit 1
fi

# Load variables from .env
source .env

if [ -z "$DISCORD_TOKEN" ] || [ -z "$GEMINI_API_KEY" ] || [ -z "$CLIENT_ID" ]; then
    echo "❌ Error: .env file is missing one of: DISCORD_TOKEN, GEMINI_API_KEY, CLIENT_ID"
    exit 1
fi

# 3. Configure gcloud project context
echo "Setting active GCP project to: $PROJECT_ID..."
gcloud config set project "$PROJECT_ID"

# 4. Enable required Google Cloud APIs
echo "Enabling required GCP APIs (Compute, Secrets, Storage, Vertex)..."
gcloud services enable \
    compute.googleapis.com \
    secretmanager.googleapis.com \
    aiplatform.googleapis.com \
    storage.googleapis.com

# 5. Provision Secret Manager credentials
create_secret_if_missing() {
    local secret_name=$1
    local secret_val=$2
    if ! gcloud secrets describe "$secret_name" &>/dev/null; then
        echo "Creating secret: $secret_name..."
        gcloud secrets create "$secret_name" --replication-policy="automatic"
    fi
    echo "Uploading new version for secret: $secret_name..."
    echo -n "$secret_val" | gcloud secrets versions add "$secret_name" --data-file=-
}

create_secret_if_missing "DISCORD_TOKEN" "$DISCORD_TOKEN"
create_secret_if_missing "GEMINI_API_KEY" "$GEMINI_API_KEY"
create_secret_if_missing "CLIENT_ID" "$CLIENT_ID"

# 6. Provision Service Account & Bind IAM Permissions
if ! gcloud iam service-accounts describe "$SA_EMAIL" &>/dev/null; then
    echo "Creating Service Account: $SA_NAME..."
    gcloud iam service-accounts create "$SA_NAME" --display-name="Race Genie VM Service Account"
    echo "Waiting 10 seconds for Service Account propagation across IAM..."
    sleep 10
else
    echo "Service Account $SA_NAME already exists."
fi

echo "Binding IAM permissions to Service Account..."
# Grant Vertex AI user access
gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="serviceAccount:${SA_EMAIL}" \
    --role="roles/aiplatform.user" \
    --quiet

# Grant Secret Manager accessor access
gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="serviceAccount:${SA_EMAIL}" \
    --role="roles/secretmanager.secretAccessor" \
    --quiet

# Grant Storage viewer access
gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="serviceAccount:${SA_EMAIL}" \
    --role="roles/storage.objectViewer" \
    --quiet

# 7. Create Custom VPC Network, Subnet & Firewall Rules
NETWORK_NAME="race-genie-network"
SUBNET_NAME="race-genie-subnet"

if ! gcloud compute networks describe "$NETWORK_NAME" &>/dev/null; then
    echo "Creating VPC Network: $NETWORK_NAME..."
    gcloud compute networks create "$NETWORK_NAME" --subnet-mode=custom
else
    echo "VPC Network $NETWORK_NAME already exists."
fi

if ! gcloud compute networks subnets describe "$SUBNET_NAME" --region="$REGION" &>/dev/null; then
    echo "Creating Subnet: $SUBNET_NAME..."
    gcloud compute networks subnets create "$SUBNET_NAME" \
        --network="$NETWORK_NAME" \
        --range="10.0.0.0/24" \
        --region="$REGION"
else
    echo "Subnet $SUBNET_NAME already exists."
fi

FIREWALL_RULE="allow-ssh-and-healthcheck"
if ! gcloud compute firewall-rules describe "$FIREWALL_RULE" &>/dev/null; then
    echo "Creating Firewall Rule: $FIREWALL_RULE..."
    gcloud compute firewall-rules create "$FIREWALL_RULE" \
        --network="$NETWORK_NAME" \
        --allow=tcp:22,tcp:3000 \
        --source-ranges="0.0.0.0/0"
else
    echo "Firewall rule $FIREWALL_RULE already exists."
fi

ROUTER_NAME="race-genie-router"
if ! gcloud compute routers describe "$ROUTER_NAME" --region="$REGION" &>/dev/null; then
    echo "Creating Cloud Router: $ROUTER_NAME..."
    gcloud compute routers create "$ROUTER_NAME" \
        --network="$NETWORK_NAME" \
        --region="$REGION"
else
    echo "Cloud Router $ROUTER_NAME already exists."
fi

NAT_NAME="race-genie-nat"
if ! gcloud compute routers describe "$ROUTER_NAME" --region="$REGION" --format="value(nats.name)" | grep -q "$NAT_NAME"; then
    echo "Creating Cloud NAT Gateway: $NAT_NAME..."
    gcloud compute routers nats create "$NAT_NAME" \
        --router="$ROUTER_NAME" \
        --region="$REGION" \
        --auto-allocate-nat-external-ips \
        --nat-all-subnet-ip-ranges
else
    echo "Cloud NAT Gateway $NAT_NAME already exists."
fi



# 8. Create GCS Deploy Bucket
if ! gcloud storage buckets describe "gs://${BUCKET_NAME}" &>/dev/null; then
    echo "Creating deployment storage bucket: gs://${BUCKET_NAME}..."
    gcloud storage buckets create "gs://${BUCKET_NAME}" --location="$REGION"
else
    echo "Bucket gs://${BUCKET_NAME} already exists."
fi

# 9. Package and Upload Source Code
echo "Packaging application source files..."
# Create a zip, omitting dev/sensitive directories
zip -q -r app.zip . \
    -x "node_modules/*" \
    -x ".git/*" \
    -x ".env" \
    -x "*.log" \
    -x "app.zip" \
    -x "deploy.sh" \
    -x "deploy-commands.js" # Commands registered locally, not needed on VM boot

echo "Uploading source package to GCS..."
gcloud storage cp app.zip "gs://${BUCKET_NAME}/app.zip"
rm app.zip

# 10. Deploy/Recreate VM Instance
if gcloud compute instances describe "$VM_NAME" --zone="$ZONE" &>/dev/null; then
    echo "⚠️ VM instance $VM_NAME already exists. Replacing it for fresh deploy..."
    gcloud compute instances delete "$VM_NAME" --zone="$ZONE" --quiet
fi

echo "Spinning up new Compute Engine VM ($VM_NAME)..."
gcloud compute instances create "$VM_NAME" \
    --zone="$ZONE" \
    --machine-type="e2-micro" \
    --service-account="$SA_EMAIL" \
    --scopes="https://www.googleapis.com/auth/cloud-platform" \
    --metadata="deploy-bucket=${BUCKET_NAME}" \
    --metadata-from-file="startup-script=startup.sh" \
    --image-family="debian-12" \
    --image-project="debian-cloud" \
    --network="$NETWORK_NAME" \
    --subnet="$SUBNET_NAME" \
    --no-address \
    --shielded-secure-boot \
    --boot-disk-size="10GB"

echo "🎉 Deployment successful!"
echo "--------------------------------------------------------"
echo "VM Name: $VM_NAME"
echo "GCP Zone: $ZONE"
echo "Note: Serial port access is disabled by your org policy. To monitor boot progress, SSH into the VM:"
echo "  gcloud compute ssh $VM_NAME --zone=$ZONE"
echo "and tail the startup script logs:"
echo "  sudo journalctl -u google-startup-scripts.service -f"
echo "--------------------------------------------------------"
