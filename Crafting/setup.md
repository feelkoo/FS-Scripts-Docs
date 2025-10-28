# Setup

## Installation
1. Copy `fs_crafting` into your resources.
2. Add `ensure fs_crafting` to `server.cfg` (after `ox_lib`, `oxmysql`, and with OneSync enabled).
3. Run the SQL script `install/tables.sql` (creates `fs_crafting_levels` and `fs_crafting_unlocks`).

## Dependencies
- `ox_lib` (UI, target, progress bar).
- `oxmysql` (stores XP and blueprint unlocks).
- OneSync (manifest dependency).
- Inventory support: `ox_inventory`, `qb-inventory`, `qs-inventory`, `core_inventory`, `quasar-inventory`, etc., configured via `Config.Inventory`.

## Core configuration
- Edit `config.lua` to set `Config.Framework`, `Config.Inventory`, `Config.Locale`, and optionally `Config.QBCoreExport`.
- `Config.Notifications` selects the notification system (`fs_notify`, `okokNotify`, ESX/QB, etc.); the switch is in `SendNotification`.
- Adjust progress bars with `Config.ProgressBarType` / `Config.UseProgressBar`.
- Toggle features such as leveling, blueprints, and queue via `Config.EnableLevelSystem`, `Config.EnableBlueprints`, `Config.EnableCraftingQueue`.
- Disable Discord logging by setting `Config.EnableDiscordLogs = false` or update the webhook URLs.

## Crafting data
- Categories: update `Config.Categories` (name, label, icon, required level).
- Benches: `Config.CraftingBenches` defines locations, target radius, job/gang locks, required items, and blips.
- Recipes: configured per category in `Config.CraftingRecipes`; each recipe lists `ingredients`, `craftTime`, `xpGained`, `levelRequired`, `successRate`, `requiresBlueprint`.
- The blueprint system uses the `useBlueprint` export (see `exports.md`) plus `Config.Blueprints`.
- Skill-check difficulty is chosen automatically via `Config.SkillCheckDifficulty`.

## Next steps
- Add all materials and crafted items to your inventory (see `items.md`).
- If you use a target system, set `Config.Target` (`ox_target`, `qb-target`, `qtarget`, `custom`).
- Adjust `Config.UI.inventoryImagePath` to match your inventory image path.
- Optional portable benches are listed in the SQL comments (`portable_*` items).
