# Race Genie (GT7 Discord Bot) 🏁

Race Genie is a no-nonsense trackside race engineer Discord bot built specifically for **Gran Turismo 7 (GT7)**. It uses the Gemini API (`gemini-2.5-flash-lite`) and is calibrated with the verified **FLUX89 Tuning Cheat Sheet** physics rules to provide drivers with immediate, context-specific car setup advice.

---

## 🚀 Key Features

*   **Slash Commands (`/setup`)**: Clean, interactive Discord interface for inputting setups (Car, Track, Weather, and Drivetrain).
*   **Multimodal Analysis**: Drivers can upload a **screenshot of their GT7 garage tuning sheet**. Race Genie reads the numbers visually, compares them to baseline specs, and instructs what specific setting clicks to adjust.
*   **Ephemerality**: Bot interactions are private (visible only to the user invoking them), keeping channels clean.
*   **Dynamic Weather Strategies**: Provides split advice for wet-to-dry transitions, balancing garage setups with real-time MFD tweaks.
*   **Smart Message Splitting**: Automatically splits long AI responses to avoid Discord's 2,000 character limit constraints.

---

## 📁 File Structure

```text
├── config.js               # Environment variables check and validation
├── deploy-commands.js      # Script to register Slash Commands with Discord
├── index.js                # Main bot entry point and Discord gateway handler
├── package.json            # Scripts, dependency locks, and engines
├── README.md               # Developer and Repository documentation (This file)
├── USER_GUIDE.md           # Copyable guide for drivers on your Discord server
├── INSTRUCTIONS.md         # Step-by-step developer portal setup & Render guide
└── services/
    ├── gemini.js           # Gemini API interface & FLUX89 system guidelines
    └── session.js          # In-memory driver conversation logs
```

---

## 🛠️ Developer Setup & Deployment

For comprehensive setup steps, please refer to:
👉 **[INSTRUCTIONS.md](file:///usr/local/google/home/darrenswift/Discord/INSTRUCTIONS.md)**

### Quick Start:

1.  **Configure environment** by creating a `.env` file in the root:
    ```env
    DISCORD_TOKEN=your_discord_bot_token
    GEMINI_API_KEY=your_gemini_api_key
    CLIENT_ID=your_discord_client_id
    PORT=3000
    ```
2.  **Install dependencies**:
    ```bash
    npm install
    ```
3.  **Register commands** globally:
    ```bash
    npm run deploy-commands --env-file=.env
    ```
4.  **Run locally** in development mode:
    ```bash
    npm run dev
    ```

---

## 🏁 Driver Command Guide

For server members, you can copy and pin this guide:
👉 **[USER_GUIDE.md](file:///usr/local/google/home/darrenswift/Discord/USER_GUIDE.md)**

*   **`/setup`**: Requests baseline specifications or reviews an uploaded tuning screenshot for a car and track combination.
*   **`/reset`**: Wipes the active conversation memory (remembers up to 6 messages) to start fresh.
