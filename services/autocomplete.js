const fs = require('fs');
const path = require('path');

let tracksCache = [];
let carsCache = [];

function loadTracklist() {
    try {
        const filePath = path.join(__dirname, '../tracklist.md');
        if (!fs.existsSync(filePath)) {
            console.warn("⚠️ tracklist.md not found. Autocomplete for tracks will be empty.");
            return [];
        }
        const content = fs.readFileSync(filePath, 'utf8');
        const lines = content.split('\n');
        const tracks = [];
        for (const line of lines) {
            if (line.startsWith('|') && !line.includes('Track | Layout') && !line.includes('---')) {
                const parts = line.split('|').map(p => p.trim());
                if (parts.length >= 3) {
                    const track = parts[1];
                    const layout = parts[2];
                    if (track && layout) {
                        const fullName = layout === 'Standard' ? track : `${track} (${layout})`;
                        tracks.push(fullName);
                    }
                }
            }
        }
        console.log(`✅ Loaded ${tracks.length} tracks into autocomplete cache.`);
        return tracks;
    } catch (e) {
        console.error("❌ Failed to parse tracklist.md:", e);
        return [];
    }
}

function loadCarList() {
    try {
        const filePath = path.join(__dirname, '../car_list.md');
        if (!fs.existsSync(filePath)) {
            console.warn("⚠️ car_list.md not found. Autocomplete for cars will be empty.");
            return [];
        }
        const content = fs.readFileSync(filePath, 'utf8');
        const lines = content.split('\n');
        const cars = [];
        for (const line of lines) {
            const trimmed = line.trim();
            if (trimmed.startsWith('*')) {
                const carName = trimmed.replace(/^\*\s*/, '').trim();
                if (carName) {
                    cars.push(carName);
                }
            }
        }
        console.log(`✅ Loaded ${cars.length} cars into autocomplete cache.`);
        return cars;
    } catch (e) {
        console.error("❌ Failed to parse car_list.md:", e);
        return [];
    }
}

// Initialize caches
tracksCache = loadTracklist();
carsCache = loadCarList();

/**
 * Filter autocomplete suggestions to return up to 25 items matching the focused query.
 */
function searchTracks(query) {
    if (!query) {
        return tracksCache.slice(0, 25);
    }
    const cleanQuery = query.toLowerCase();
    return tracksCache
        .filter(track => track.toLowerCase().includes(cleanQuery))
        .slice(0, 25);
}

function searchCars(query) {
    if (!query) {
        return carsCache.slice(0, 25);
    }
    const cleanQuery = query.toLowerCase();
    return carsCache
        .filter(car => car.toLowerCase().includes(cleanQuery))
        .slice(0, 25);
}

module.exports = {
    searchTracks,
    searchCars
};
