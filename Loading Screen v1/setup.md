# Setup

## Installation
1. Ensure only one loadscreen resource is enabled.
2. Copy `fs_loading_screen` into your resources.
3. Add `ensure fs_loading_screen` at the top of `server.cfg` (before other resources).

## Configuration
- Tweak background, text, and layout in `app/app.html` and `app/app.css`.
- Replace the audio in `assets/music.mp3` (keep the name or update the path in `app/app.js`).
- Default volume and controls live in `app/app.js` (`setVolume(50)`).
- To disable music, remove the `audio.play()` call or set `audio.volume = 0`.
- Swap branding assets in the `assets/` folder.

## Tips
- If you need to manually close the loadscreen after character load, call `ShutdownLoadingScreenNui()` from another script (the loadscreen stays until progress reaches 100%).
