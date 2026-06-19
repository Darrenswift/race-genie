# Migrating to GCP Vertex AI ☁️

This guide outlines how to update the Race Genie bot to use **Google Cloud Platform (GCP) Vertex AI** instead of the free Gemini Developer API.

---

## 🛠️ Step 1: Update Environment Variables

You need to replace `GEMINI_API_KEY` with your GCP project information and the path to your service account JSON key file.

### In your `.env` file (Local):
```env
# Remove GEMINI_API_KEY
GCP_PROJECT_ID=your-gcp-project-id
GCP_LOCATION=us-central1
GOOGLE_APPLICATION_CREDENTIALS=gcp-key.json
```

> [!WARNING]
> Save your GCP service account credentials file as `gcp-key.json` in the root of the project. Make sure it is added to your `.gitignore` to prevent pushing credentials to public Git repos!

---

## 💾 Step 2: Code Adjustments

All API configurations are isolated in `services/gemini.js`.

### 1. Update `config.js`
Update config parsing to support the new GCP environment variables:

```javascript
// config.js
const requiredEnv = ['DISCORD_TOKEN', 'CLIENT_ID', 'GCP_PROJECT_ID'];

for (const envVar of requiredEnv) {
    if (!process.env[envVar]) {
        console.error(`❌ CRITICAL: Missing environment variable: ${envVar}`);
        process.exit(1);
    }
}

module.exports = {
    DISCORD_TOKEN: process.env.DISCORD_TOKEN,
    CLIENT_ID: process.env.CLIENT_ID,
    PORT: process.env.PORT || 3000,
    GCP_PROJECT_ID: process.env.GCP_PROJECT_ID,
    GCP_LOCATION: process.env.GCP_LOCATION || 'us-central1',
};
```

### 2. Update `services/gemini.js`
Modify the client initialization to reference the GCP project and location (the SDK automatically detects `GOOGLE_APPLICATION_CREDENTIALS` for authentication):

```javascript
// services/gemini.js
const { GoogleGenAI } = require('@google/genai');
const { GCP_PROJECT_ID, GCP_LOCATION } = require('../config');

// Initialize client for Vertex AI
const ai = new GoogleGenAI({
    project: GCP_PROJECT_ID,
    location: GCP_LOCATION
});
```

---

## 🚀 Step 3: Deploying on Render with GCP Secret Files

Since you should never push your `gcp-key.json` to GitHub, configure it inside Render:

1. Go to the **Render Dashboard**.
2. Select your **Web Service** -> **Environment** tab.
3. Click **Add Secret File**.
    *   **Filename**: `gcp-key.json`
    *   **Contents**: Paste the entire contents of your service account JSON file.
4. Add the following **Environment Variables** in Render:
    *   `GCP_PROJECT_ID` = *your_gcp_project_id*
    *   `GCP_LOCATION` = `us-central1` (or your chosen Vertex AI region)
    *   `GOOGLE_APPLICATION_CREDENTIALS` = `/etc/secrets/gcp-key.json` (Render automatically stores secret files at this path).
