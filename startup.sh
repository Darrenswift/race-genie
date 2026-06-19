#!/bin/bash
# GCP VM Startup Script for Race Genie Bot
set -e

# 1. Update system and install base utilities (curl, unzip)
echo "Installing base utilities..."
apt-get update && apt-get install -y curl unzip

# 2. Install Node.js 22
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs

# 2. Install PM2 globally
npm install -g pm2

# 3. Create deployment directory
mkdir -p /opt/race-genie
cd /opt/race-genie

# 4. Fetch the deploy bucket name from VM metadata and download source zip
echo "Downloading source bundle from GCS..."
DEPLOY_BUCKET=$(curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/attributes/deploy-bucket)
gcloud storage cp gs://$DEPLOY_BUCKET/app.zip app.zip
unzip -o app.zip
rm app.zip

# 5. Retrieve secrets from GCP Secret Manager
echo "Retrieving runtime credentials from Secret Manager..."
export DISCORD_TOKEN=$(gcloud secrets versions access latest --secret="DISCORD_TOKEN")
export GEMINI_API_KEY=$(gcloud secrets versions access latest --secret="GEMINI_API_KEY")
export CLIENT_ID=$(gcloud secrets versions access latest --secret="CLIENT_ID")

# 6. Generate the .env config file locally on the VM
cat <<EOF > .env
DISCORD_TOKEN=$DISCORD_TOKEN
GEMINI_API_KEY=$GEMINI_API_KEY
CLIENT_ID=$CLIENT_ID
PORT=3000
EOF

# 7. Install packages and start PM2 execution daemon
echo "Starting application with PM2..."
npm install --omit=dev
pm2 start index.js --name "race-genie"

# 8. Configure PM2 daemon to survive VM reboots
env PATH=$PATH:/usr/bin pm2 startup systemd -u root --hp /root
pm2 save
echo "Race Genie started successfully!"
