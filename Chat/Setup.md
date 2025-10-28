# Setup

## Installation
1. Remove or disable the default `chat` resource (`ensure fs_chat` already provides `chat`).
2. Copy `fs_chat` into your resources and add `ensure fs_chat` to `server.cfg`.
3. Add custom locale files to `locales/` if needed.

## Configuration
- `Config.Framework` and `Config.Locale` select the framework and language.
- Point `Config.ClientNotification` / `Config.ServerNotification` to your notification system (defaults to `ox_lib`).
- Define admin privileges via `Config.AdminGroups`; use `allowedJobs` per command for job restrictions.
- Control name display (anti-metagaming) with `Config.ICNameDisplay` (`full`, `firstname`, `initial`, `id`).
- Toggle and style 3D text via `Config.Enable3DText` and `Config.ThreeDText`.
- `Config.Commands` lists every command definition (type, price, cooldown, jobs, distance).
- Configure social features and broadcasts in `Config.SocialCommands` and `Config.AutoMessages`.

## Extras
- Customise the UI in `app/css/app.css` and `app/js/app.js`.
- Use server hooks like `LogCommandUsage` in `server/server.lua` for custom logging.
