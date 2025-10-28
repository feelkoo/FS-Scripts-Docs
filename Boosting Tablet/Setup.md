## Installation
1. Copy `fs_boosting_tablet` into your resources folder.
2. Add `ensure fs_boosting_tablet` to `server.cfg` (after `es_extended`, `ox_lib`, `oxmysql`, `ox_target`, `ox_inventory`, `cd_dispatch`).
3. Run `install/sql/install.sql` on your database (creates the `fs_boosting_tablet_*` tables for players, missions, history, and the shop).

## Dependencies
- ESX (`es_extended`) plus `oxmysql` for persistent progress.
- `ox_lib` (notifications, progress bar), `ox_target` (interactions), `ox_inventory` (items).
- Dispatch: by default integrates with `cd_dispatch`; adjust `Config.Dispatch` for other systems.
- QBCore is supported via the `shared_scripts` import; no extra work is needed.

## Configuration
- `Config.TabletItem`, `Config.MaxConcurrentMissions` hold the basic toggles.
- Adapt notifications (`Config.Notification.Show`) and progress bars (`Config.ProgressBar.Show`) to your wrappers.
- Police alerts and wanted logic live in `Config.Dispatch`.
- Mission economy: tune `Config.VehicleClasses` (payouts, XP, vehicles, bodyguards), `Config.Deliveries`, and `Config.MissionSettings`.
- Shop: configure `Config.EthereumShop` (items, prices, bonuses) plus `Config.ShopPaperHints` / `Config.ShopPaperConfig` for hint papers.
- Use `Config.RequireItem`, `Config.Leveling`, `Config.MemberLimits`, etc., to fit your server rules.

## Next steps
- Add tablet, paper, and tracker items and their icons (see `items.md` and `install/imgs`).
- Adjust spawn zones (pickup/delivery) so they match your map; `vector3`/`vector4` definitions are in the config.
- Disable `Config.Dispatch.enabled` if you prefer to handle dispatch yourself.
- After the first launch check the console for localization or target dependency warnings.
