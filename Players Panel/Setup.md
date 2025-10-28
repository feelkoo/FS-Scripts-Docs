# Setup

## Installation
1. Copy `fs_players` into your resources.
2. Add `ensure fs_players` to `server.cfg`.

## Configuration
- `Config.Locale` and the files in `locales/` control UI text.
- Leave `Config.Framework = 'auto'` or set it manually to `'esx'`, `'qb-core'`, or `'standalone'`.
- Change the hotkey via `RegisterKeyMapping('togglePlayerPanel', ..., 'keyboard', 'DELETE')`.
- Define job categories in `Config.Categories` and `Config.Departments`. Update colours/icons in `Config.Departments[*].color/icon`.
- Use `Config.JobMapping['qb-core']` to map QBCore jobs into departments.
- Logo and overlay opacity live in `Config.UI`.

## Notes
- The server script fetches player names/jobs via the ESX/QB API. For a custom framework, keep `standalone` and modify `GetPlayerData` in `server/server.lua`.
- Customise the UI in the `app/` directory (HTML/CSS/JS).
