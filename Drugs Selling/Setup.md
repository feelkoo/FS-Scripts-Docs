# Setup

## Installation
1. Copy `fs_drugsell` into your resources.
2. Add `ensure fs_drugsell` to `server.cfg` after `ox_lib` and `oxmysql`.
3. Run `install/install.sql` to create the `fs_drugsell_players` table.

## Dependencies
- `ox_lib` (target, notifications, progress).
- `oxmysql` (persists statistics).
- Inventory support: `ox_inventory`, `qb-inventory`, `ps`, `qs`, etc., configured via `Config.Inventory`.

## Configuration
- Set framework and inventory in `Config.Framework`, `Config.Inventory`, `Config.Target`, `Config.MoneyType`.
- Target behaviour (`Config.TargetLabel`, `Config.TargetIcon`, `Config.InteractionDistance`) defines the interaction prompt.
- Cooldowns and NPC behaviour: `Config.SellCooldown`, `Config.NPCCooldown`, `Config.CallPoliceChance`, `Config.MinPoliceOnline`.
- Leveling: `Config.Leveling` controls XP per sale, price increase per level, and level-up notifications.
- Daily cap: `Config.DailyLimit` (maximum sales, reset time, remaining notifications).
- Hot zones: `Config.HotZones` (enable, rotation time, price multiplier, blip visibility).
- Configure drugs in `Config.Drugs` (item, label, description, price min/max, required level, job restriction, min/max amount).
- Police alerts live in `Config.Dispatch`; disable `enabled` if you manage dispatch elsewhere.

## Next steps
- Add the drug items (see `items.md`) and corresponding images to your inventory.
- If you use a custom notification system, adjust `Config.SendNotification`.
- Review job/account mappings such as `Config.PoliceJobs`, `Config.BlackMoneyAccount`, etc., further down in the config.
