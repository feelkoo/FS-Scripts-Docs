# Setup

## Installation
1. Copy `fs_carmenu` into your resources.
2. Add `ensure fs_carmenu` to `server.cfg` after `ox_lib`.

## Dependencies
- `ox_lib` (manifest shared script).
- No database or additional resources are required.

## Configuration
- Change the hotkey by editing `RegisterKeyMapping` in `client/client.lua`.
- Replace `lib.notify` in the same file if you use a different notification system.
- UI elements (icons, text) can be customised in `web/js/app.js` and `web/css/app.css`.
