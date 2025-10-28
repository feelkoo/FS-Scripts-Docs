# Setup

## Installation
1. Copy `fs_wiring` into your resources.
2. Add `ensure fs_wiring` to `server.cfg`.

## Configuration
- `Config.DefaultDifficulty` selects which profile is used when the export fires.
- Each profile in `Config.WiringDifficulty` defines the wire list, time limit (seconds), and description.
- Set wire colours in `Config.WireColors` (HEX).
- `Config.GameSettings` covers UI behaviour (shuffle right side, sounds, disable movement, progress display).
- Sounds use GTA frontend sound sets; adjust them in `Config.GameSettings.sounds`.
- To expose more exports (e.g. `isMinigameActive`), enable them in `Config.Exports` and implement the logic in `client/client.lua` (currently only `startWiringMinigame` is wired up).

## Integration
- Call the `startWiringMinigame` export from your script (see `exports.md`) and provide success/failure callbacks.
- Use the `fs_wiring:minigameCompleted` server event for logging or additional handling.
