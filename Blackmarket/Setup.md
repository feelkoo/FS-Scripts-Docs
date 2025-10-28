# Setup

## Installation
1. Copy the `fs_blackmarket` folder into your server resources.
2. Add `ensure fs_blackmarket` to `server.cfg` (after `ox_lib` and your chosen target/progress resources).
3. Upload the `app/` files to the server unchanged.

## Dependencies
- `ox_lib` (manifest dependency).
- Inventory: set `Config.Inventory` to `ox_inventory` or `qb-inventory`.
- Targeting: pick `ox_target` or `qb-target` via `Config.Target`.
- Progress bar: `ox_lib` or `qb-progressbar`.
- Optional notifications: the default calls `fs_notify`, but you can switch to `okokNotify`, ESX/QBCore, etc., inside `Config.SendClientNotification`.

## Core configuration
- Adjust `Config.Framework`, `Config.Locale`, and `Config.InventoryImagePath` to match your framework and inventory.
- `Config.Tablet` defines the animation, prop, and progress behaviour when the tablet is used.
- Configure `Config.Notifications` and `Config.SendClientNotification` for your preferred messaging system.
- NPC behaviour (respawn timers, models, vehicle, bodyguards) lives in `Config.NPC*`, `Config.Bodyguard*`, `Config.ReactionChances`.
- Set up merchandise in `Config.Items`. Items of type `weapon` give weapons; type `item` uses the `amount` field. Valid `currency` values are `money` or `black_money`.
- Dealer spawn points are defined in `Config.SpawnLocations`; each entry can include vehicle, dealer, and bodyguard positions.

## Next steps
- Add the `blackmarket_tablet` item to your inventory (see `items.md`) and include the icon in your inventory image folder.
- Configure the products in `Config.Items` and ensure every weapon/item exists in your inventory system.
- If you use a custom notification system, uncomment and adapt the appropriate line in `Config.SendClientNotification`.
