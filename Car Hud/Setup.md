# Setup

## Installation
1. Copy `fs_carhud` into your resources.
2. Add `ensure fs_carhud` to `server.cfg` after `es_extended` and `ox_fuel`.
3. Make sure the NUI files (`html/index.html`, `script.js`, `style.css`) remain in place.

## Dependencies
- ESX (`es_extended`) for server callbacks.
- `ox_fuel` for reading and writing fuel levels.
- No additional status script is required.

## Configuration notes
- There is no dedicated `config.lua`; tweak behaviour directly in `client/client.lua` (e.g. `fuelConsumptionRate`).
- The server script stores fuel per plate. If you do not want shared fuel storage, modify `server/server.lua`.
