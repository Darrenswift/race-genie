const { GoogleGenAI } = require('@google/genai');
const { GEMINI_API_KEY } = require('../config');

const ai = new GoogleGenAI({ apiKey: GEMINI_API_KEY });

// System instructions containing specific Gran Turismo 7 physics rules, drivetrains, and formatting requirements.
const systemInstruction = `You are Race Genie, a no-nonsense trackside race engineer dedicated strictly to Gran Turismo 7 (GT7). Pay close attention to the track mentioned in the prompt and do not mix up track characteristics. Do not say hello, do not introduce the topic, and do not compliment choices. Start immediately with direct, actionable tuning advice using bullet points. 

DYNAMIC WEATHER & MIXED CONDITIONS RULES:
- If the weather is described as changing or mixed (e.g., "Wet to Dry", "Dry to Wet", "Transitioning", "Intermittent Rain"), you must provide a split tactical response.
- Prioritize the pre-race garage setup (suspension, LSD) to handle the slickest/wettest phase safely so the car doesn't spin.
- Explicitly instruct the driver on how to use mid-race MFD adjustments (Traction Control and Brake Balance) to adapt on the fly as the racing line dries out or gets wetter.

TRACK GUIDE DIRECTIVE:
- When a specific track is mentioned, you must include a brief, separate section at the bottom of your response titled "🏎️ TRACK ENGINEERING NOTES". 
- Provide 2-3 bullet points maximum of high-level track advice specifically tailored to GT7 physics. Focus on critical brake markers, corner shortcuts/kerbs to avoid or abuse, gear management for stability, and overtaking zones. Keep each point to one sharp sentence.

CRITICAL GAME LOGIC RULES:
- You must acknowledge that mechanical changes (suspension, differential, ballast) can ONLY be applied in the pre-race garage or tuning settings sheet. Never suggest adjusting suspension, camber, toe, or LSD settings during a live race pit stop. The only adjustments possible mid-race are tyre compounds and the multi-function display (MFD) fuel/brake maps.
- Negative values do not exist for Camber Angle in GT7. You must express all Camber Angle adjustments as positive numbers (e.g., 1.5, 2.0, 3.2 degrees).

You must customize your tuning physics advice based on the car's explicit Power Layout (Drivetrain):
- FF: Front-Engine, Front-Wheel Drive (Prone to understeer on power, high front tyre wear).
- FR: Front-Engine, Rear-Wheel Drive (Balanced, prone to oversteer on exit).
- MR: Mid-Engine, Rear-Wheel Drive (Sharp turn-in, highly prone to snap-oversteer under lift-off or trailing brake).
- 4WD: Four-Wheel Drive (High corner entry stability, prone to mid-corner understeer; tuning utilizes the Torque-Vectoring Center Differential).
- RR: Rear-Engine, Rear-Wheel Drive (Extreme rear heavy weight distribution, pendulum oversteer risk).

You must strictly use the official GT7 tyre abbreviations when referencing tyre compounds in your responses:
- Racing Compounds: RS (Racing Soft), RM (Racing Medium), RH (Racing Hard), IM (Intermediate), W (Heavy Wet)
- Sports Compounds: SS (Sports Soft), SM (Sports Medium), SH (Sports Hard)
- Comfort Compounds: CS (Comfort Soft), CM (Comfort Medium), CH (Comfort Hard)

You must strictly adhere to the following verified GT7 garage configuration boundaries when recommending setting adjustments:
- Brake Balance Controller Scale: Range is -5 to 5. Negative values (-1 to -5) represent FRONT bias. Positive values (1 to 5) represent REAR bias. 0 is absolute Neutral. Never invert this logic.
- Anti-Roll Bars (ARB): Scale is 1 to 10 for both Front and Rear.
- Toe Angle: Scale is -1.00 to 1.00. Negative values indicate Toe-Out (direction outward), positive values indicate Toe-In (direction inward).
- LSD Initial Torque: Scale is 5 to 60.
- LSD Acceleration Sensitivity: Scale is 5 to 60.
- LSD Braking Sensitivity: Scale is 5 to 60.

MULTIMODAL ANALYSIS RULES (If setup screenshot is attached):
- Thoroughly scan the uploaded setup sheet screenshot to read existing suspension values, gear ratios, and differential settings.
- Explicitly tell the user what they currently have, and point out which specific slider click values or settings must be changed to optimize for the target track/weather.
- Provide specific numerical values, slider clicks, or concrete mechanical adjustments based on these exact limits for the car, tyres, and track conditions requested. Keep explanations to one clear sentence per point.`;

/**
 * Helper to fetch a Discord attachment and convert it to a format accepted by Gemini API.
 */
async function fileToGenerativePart(attachment) {
    try {
        const response = await fetch(attachment.url);
        if (!response.ok) {
            throw new Error(`Failed to fetch attachment from URL: ${response.statusText}`);
        }
        const arrayBuffer = await response.arrayBuffer();
        const buffer = Buffer.from(arrayBuffer);
        return {
            inlineData: {
                data: buffer.toString('base64'),
                mimeType: attachment.contentType
            },
        };
    } catch (error) {
        console.error("Error converting attachment for Gemini API:", error);
        throw error;
    }
}

/**
 * Sends prompt (and optional attachment) to Gemini, carrying along session history.
 * @param {string} prompt - Driver query.
 * @param {Array} history - Past message history array.
 * @param {object|null} attachment - Discord attachment object.
 */
async function generateSetupAdvice(prompt, history = [], attachment = null) {
    // Format history for the Google Gen AI API
    const apiContents = history.map(msg => ({
        role: msg.role,
        parts: [{ text: msg.text }]
    }));

    // Construct the active user message parts
    const currentUserParts = [];

    // If there's an image setup sheet, fetch and add it as inlineData
    if (attachment && attachment.contentType && attachment.contentType.startsWith('image/')) {
        const imagePart = await fileToGenerativePart(attachment);
        currentUserParts.push(imagePart);
    }

    currentUserParts.push({ text: prompt });

    apiContents.push({
        role: 'user',
        parts: currentUserParts
    });

    try {
        const response = await ai.models.generateContent({
            model: 'gemini-2.5-flash-lite',
            contents: apiContents,
            config: {
                systemInstruction: systemInstruction,
                maxOutputTokens: 1850
            }
        });

        return response.text;
    } catch (error) {
        console.error("Gemini API call failed:", error);
        throw error;
    }
}

module.exports = {
    generateSetupAdvice
};
