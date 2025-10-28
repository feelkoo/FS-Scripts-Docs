# Setup

## Installation
1. Copy `fs_notify` into your resources.
2. Add `ensure fs_notify` to `server.cfg` (the UI has no additional dependencies).

## Configuration
- Change default position/duration in `config.lua` (`Config.DefaultPosition`, `Config.DefaultDuration`).
- Tune the maximum number of simultaneous notifications (`Config.MaxNotifications`), animation speed, and spacing (`Config.AnimationSpeed`, `Config.Spacing`).
- Disable sound by setting `Config.EnableSound = false`.
- Icons (`Config.Icons`) and colours (`Config.Colors`) use Font Awesome classes and can be customised freely.
- Toggle the bottom/icon progress indicators via `Config.ShowBottomProgress` and `Config.ShowIconProgress`.
