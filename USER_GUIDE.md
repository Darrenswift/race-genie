# 🏁 Race Genie: Driver's User Guide

Welcome to **Race Genie**, your virtual AI Trackside Race Engineer for Gran Turismo 7 (GT7). Race Genie is powered by Gemini and trained on the verified **FLUX89 Tuning Cheat Sheet** physics rules to help you dial in your setups for any car and track combination.

All interaction happens privately and cleanly via Discord's Slash Commands.

---

## 🏎️ Core Commands

### 1. `/setup`
Use this command to get starting baseline setups, dial-in adjustments, or review an existing tuning sheet.

**Options/Parameters:**
*   `car` *(Required)*: The name/model of your car (e.g., `Gr.3 Mercedes AMG`, `Porsche 911 GT3 RS '22`).
*   `track` *(Required)*: The track you are racing on (e.g., `Spa-Francorchamps`, `Nürburgring GP`).
*   `weather` *(Optional)*: Current or transitioning weather (e.g., `Heavy Rain`, `Wet to Dry Transition`, `Intermittent Damp`).
*   `drivetrain` *(Optional)*: Select layout (`FR`, `MR`, `FF`, `4WD`, or `RR`) if you want to ensure the bot uses exact drivetrain dynamics immediately.
*   `screenshot` *(Optional)*: **Attach a screenshot of your current GT7 garage tuning sheet.** The bot will analyze your actual numbers and tell you exactly which settings to increase/decrease!

### 2. `/reset`
Race Genie remembers the context of your conversation (up to 6 messages). If you are moving to a completely different car or track, use `/reset` to clear the bot's memory and start fresh.

---

## 💡 How to Get the Best Results

### 1. Uploading Tuning Screenshots 📸
Instead of typing your current suspension numbers, simply take a screenshot of your in-game GT7 Tuning Sheet and upload it using the `screenshot` option in `/setup`.
*   **What happens**: Race Genie reads your current Ride Height, Springs (NF), Anti-Roll Bars, Dampers, Camber, Toe, and LSD values.
*   **The output**: You get step-by-step instructions on which settings to tweak relative to your current baseline.

### 2. Handling Transitioning Weather 🌦️
If you type weather conditions like *"Wet to Dry"* or *"Transitioning"*, Race Genie will output a split response:
*   **Garage Setup**: The base suspension & LSD settings to handle the wettest phase safely.
*   **Mid-Race Adjustments**: Advice on when and how to adjust your mid-race MFD (Traction Control and Brake Balance) on the fly as the track dries out.

### 3. Track Engineering Notes 🏎️
At the bottom of every setup sheet, look out for the **🏎️ TRACK ENGINEERING NOTES** section. These are 2-3 high-level tips specifically tailored to GT7 physics for that track (e.g. curb placement to avoid, gear management for stability, and overtaking zones).

---

## 🛠️ Step-by-Step Tuning Workflow

For the ultimate setup, follow this workflow:
1.  **Baseline**: Run `/setup` with your car and track to get baseline settings.
2.  **Test**: Take the car out for 3-5 laps.
3.  **Tweak**: If the car suffers from specific handling issues, ask follow-up questions (e.g., *"The car has severe oversteer on corner exit"*) OR upload a screenshot of your current settings sheet.
4.  **Evaluate**: Apply the suggested changes *one at a time* and re-evaluate.
