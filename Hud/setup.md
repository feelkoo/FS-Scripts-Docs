# Setup

## Installation
1. Copy `fs_hud` into your resources.
2. Add `ensure fs_hud` to `server.cfg` after the dependencies (`ox_inventory`, `es_extended`, `esx_status`, `pma-voice`).

## Dependencies
- ESX (`es_extended`) for `esx:onPlayerLoaded` / `esx:onPlayerLogout`.
- `esx_status` (provides hunger and thirst values).
- `ox_inventory` (required because the client imports ESX from it).
- `pma-voice` (minimap positioning).

## Configuration
- There is no dedicated config; make adjustments in `client/client.lua`.
- Status polling runs every second (`Citizen.Wait(1000)`); feel free to tweak for performance.
- Edit UI text and styling in the `html/` folder.
- If you do not want the vehicle HUD hiding behaviour, adjust the `enterCar` / `exitCar` NUI messages.
