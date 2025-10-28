# Setup

## Installation
1. Copy `fs_papers` into your resources.
2. Add `ensure fs_papers` to `server.cfg` after `ox_lib` (manifest dependency).
3. Place the `fs_paper.png` icon in your inventory image folder.

## Configuration
- Leave `Config.Inventory` empty for auto detection or set it explicitly (`'ox_inventory'`, `'qb'`, `'ps'`, `'qs'`, `'codem'`).
- `Config.Papers` maps item names to `title` and `description` (multi-line `[[ ... ]]` supported).
- `Config.ProgressBar.duration` must match the item `usetime`; the label only displays on QB inventories.
- Change the close key via `Config.Controls.closeKey` (defaults to `ESCAPE`).

## Next steps
- Add the item definitions to your inventory (see `items.md`).
- QBCore auto-registers items; other inventories may need manual configuration.
- Update UI text, logos, etc., inside the `web/` folder.
