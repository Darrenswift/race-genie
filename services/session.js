// Simple session store interface to manage bot conversation memory.
// Easily swappable for SQLite, Turso, or Redis in the future.
const conversations = new Map();

const MAX_HISTORY = 6; 
const TIMEOUT_MS = 60 * 60 * 1000; // 1-hour session duration

function getSession(userId) {
    const now = Date.now();
    if (!conversations.has(userId) || (now - conversations.get(userId).lastActive > TIMEOUT_MS)) {
        conversations.set(userId, { history: [], lastActive: now });
    }
    const session = conversations.get(userId);
    session.lastActive = now;
    return session;
}

function updateSessionHistory(userId, userPrompt, modelResponse) {
    const session = getSession(userId);
    session.history.push({ role: 'user', text: userPrompt });
    session.history.push({ role: 'model', text: modelResponse });

    if (session.history.length > MAX_HISTORY) {
        session.history.splice(0, session.history.length - MAX_HISTORY);
    }
}

function clearSession(userId) {
    if (conversations.has(userId)) {
        conversations.delete(userId);
        return true;
    }
    return false;
}

// Periodic memory cleanup routine running every 60 minutes
setInterval(() => {
    const now = Date.now();
    for (const [userId, session] of conversations.entries()) {
        if (now - session.lastActive > TIMEOUT_MS) {
            conversations.delete(userId);
            console.log(`Cleaned up idle session memory for user: ${userId}`);
        }
    }
}, 60 * 60 * 1000);

module.exports = {
    getSession,
    updateSessionHistory,
    clearSession
};
