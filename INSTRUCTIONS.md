# Race Genie Discord Bot Setup Guide

Welcome! This guide explains how to set up your Discord application, register commands, and host it.

---

## 🛠️ Step 1: Create a Discord Application on the Developer Portal

To connect your code to Discord, you need to register it as an application:

1. Go to the [Discord Developer Portal](https://discord.com/developers/applications).
2. Log in with your Discord account.
3. Click the **"New Application"** button in the top-right corner.
4. Name your application (e.g., `Race Genie`) and accept the terms, then click **Create**.

---

## 🔑 Step 2: Retrieve API Keys and Client IDs

Once the application is created, you need to collect credentials for your code configuration:

### 1. Client ID (Application ID)
*   On the **General Information** page (the landing tab of your application), copy the **"Application ID"**.
*   This is your `CLIENT_ID`.

### 2. Bot Token
*   Go to the **Bot** tab on the left-side menu.
*   Click the **Add Bot** button (if it isn't already added).
*   Under the bot username section, click **"Reset Token"** and confirm.
*   **Copy the token immediately** and save it somewhere secure. (This is your `DISCORD_TOKEN`). *For security, Discord only displays this token once.*

---

## ⚙️ Step 3: Enable Bot Gateway Intents

In the **Bot** tab on the Discord Developer Portal:
1. Scroll down to **"Privileged Gateway Intents"**.
2. **Note**: Since this bot now exclusively uses Slash Commands (which are managed directly by Discord's Interaction Gateway), you do **NOT** need to enable any privileged intents (like Message Content Intent). This makes bot verification and hosting much easier!

---

## 🔗 Step 4: Generate Invite Link to Join Your Server

To add the bot to your Discord server:
1. Go to the **OAuth2** tab on the left menu, then click **URL Generator**.
2. Under **Scopes**, select:
    *   `bot`
    *   `applications.commands` (This is required for slash commands to register).
3. Under **Bot Permissions** (appears at the bottom after selecting `bot`), check:
    *   `Send Messages`
    *   `Use Slash Commands`
4. Copy the generated URL at the bottom of the page.
5. Open a new tab in your browser, paste the URL, select your Discord server, and click **Authorize**.

---

## 💻 Step 5: Local Development Setup

To test the bot locally before pushing to production (Render):

1. **Create a `.env` file** in the root directory of your project (`/usr/local/google/home/darrenswift/Discord/.env`) with the following variables:
    ```env
    DISCORD_TOKEN=your_copied_discord_bot_token
    GEMINI_API_KEY=your_gemini_api_key
    CLIENT_ID=your_copied_client_id
    PORT=3000
    ```

2. **Install dependencies**:
    ```bash
    npm install
    ```

3. **Deploy the Slash Commands**:
    Before the bot can respond to slash commands, you must register them with Discord's servers. Run:
    ```bash
    npm run deploy-commands --env-file=.env
    ```
    *Note: The global slash command registration takes Discord up to 1 hour to cache and propagate to all servers.*

4. **Start the bot**:
    ```bash
    npm run dev
    ```

---

## 🚀 Step 6: Deploying to Render

To keep the bot running 24/7 on Render:

1. **Create a Web Service** on Render connected to your Git repository.
2. In the service settings:
    *   **Build Command**: `npm install`
    *   **Start Command**: `npm start`
3. Add the following **Environment Variables** in Render's dashboard under your Web Service settings:
    *   `DISCORD_TOKEN` = *your_discord_bot_token*
    *   `GEMINI_API_KEY` = *your_gemini_api_key*
    *   `CLIENT_ID` = *your_client_id*
    *   `PORT` = `10000` (Render allocates this automatically, but setting it explicitly is a good backup).
4. Run the deploy script once locally to register your commands globally so they appear on your server.
