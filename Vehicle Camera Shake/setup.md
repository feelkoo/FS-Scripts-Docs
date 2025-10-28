# Setup

## Installation
1. Copy `fs_camera_shake` into your resources.
2. Add `ensure fs_camera_shake` to `server.cfg`.
3. No database or UI configuration is required.

## Configuration
- `Config.MinSpeed` / `Config.MaxSpeed`: speed thresholds in mph that drive the intensity calculation.
- `Config.ShakeType`: gameplay shake preset (`SMALL_EXPLOSION_SHAKE`, `MEDIUM_EXPLOSION_SHAKE`, ...).
- `Config.MinDuration` / `Config.MaxDuration`: effect duration in milliseconds.
- `Config.MinAmplitude` / `Config.MaxAmplitude`: strength range for the shake.
- Enable logging by setting `Config.Debug = true`.
