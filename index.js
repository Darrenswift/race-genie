const { Client, GatewayIntentBits, ActivityType } = require('discord.js');
const http = require('http');
const { DISCORD_TOKEN, PORT } = require('./config');
const { generateSetupAdvice } = require('./services/gemini');
const { getSession, updateSessionHistory, clearSession } = require('./services/session');

// Simple web server for Render health checks
http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Race Genie running!\n');
}).listen(PORT, () => {
    console.log(`Health check server listening on port ${PORT}`);
});

// Initialize Discord Client.
// When using ONLY slash commands, we only need the Guilds intent.
const client = new Client({
    intents: [
        GatewayIntentBits.Guilds
    ]
});

client.once('ready', () => {
    console.log(`Logged in as ${client.user.tag}!`);
    client.user.setActivity('GT7 Telemetry', { type: ActivityType.Watching });
});

client.on('interactionCreate', async (interaction) => {
    if (!interaction.isChatInputCommand()) return;

    const { commandName, user } = interaction;

    if (commandName === 'setup') {
        const car = interaction.options.getString('car');
        const track = interaction.options.getString('track');
        const weather = interaction.options.getString('weather') || 'Standard Dry';
        const drivetrain = interaction.options.getString('drivetrain');
        const screenshot = interaction.options.getAttachment('screenshot');

        // Defer reply immediately since Gemini calls can take over 3 seconds
        // Using ephemeral: true so the setup remains private to the user
        await interaction.deferReply({ ephemeral: true });

        // Retrieve user session history
        const session = getSession(user.id);

        // Construct clean structured prompt for Gemini
        let userPrompt = `Request details:
- Car: ${car}
- Track: ${track}
- Weather/Conditions: ${weather}`;

        if (drivetrain) {
            userPrompt += `\n- Drivetrain Layout: ${drivetrain}`;
        }
        if (screenshot) {
            userPrompt += `\n- A screenshot of the current tuning sheet is attached.`;
        }

        try {
            const advice = await generateSetupAdvice(userPrompt, session.history, screenshot);

            // Update session history
            updateSessionHistory(user.id, userPrompt, advice);

            // Respond privately to the user
            await interaction.editReply({
                content: `🏁 **YOUR PRIVATE SETUP SHEET:**\n\n${advice}`
            });

        } catch (error) {
            console.error("Interaction Setup Error:", error);
            await interaction.editReply({
                content: "⚠️ *Engineering telemetry link dropped. Please try again in a moment.*"
            });
        }
    }

    if (commandName === 'reset') {
        const deleted = clearSession(user.id);
        if (deleted) {
            await interaction.reply({
                content: "🏁 *Race memory cleared. Setup cache is back to baseline.*",
                ephemeral: true
            });
        } else {
            await interaction.reply({
                content: "🏁 *You don't have any active setup session memory to clear.*",
                ephemeral: true
            });
        }
    }
});

client.login(DISCORD_TOKEN);
