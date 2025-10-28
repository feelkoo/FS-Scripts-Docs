# FS Camera Shake

Lightweight client script that triggers a gameplay camera shake after vehicle impacts, scaled by pre-crash speed.

- Monitors the driver and adjusts intensity via `Config.MinSpeed` / `Config.MaxSpeed`.
- Automatically stops the shake after the calculated duration.
- Enable debug logs with `Config.Debug`.
