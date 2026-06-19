// Configuration validation and export
const requiredEnv = ['DISCORD_TOKEN', 'GEMINI_API_KEY', 'CLIENT_ID'];

for (const envVar of requiredEnv) {
    if (!process.env[envVar]) {
        console.error(`❌ CRITICAL: Missing environment variable: ${envVar}`);
        process.exit(1);
    }
}

module.exports = {
    DISCORD_TOKEN: process.env.DISCORD_TOKEN,
    GEMINI_API_KEY: process.env.GEMINI_API_KEY,
    CLIENT_ID: process.env.CLIENT_ID,
    PORT: process.env.PORT || 3000,
};
