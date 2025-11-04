# Setup

## Installation
1. Copy `fs_multijob` into your resources.
2. Add `ensure fs_multijob` to `server.cfg` after `ox_lib` and `oxmysql` (manifest dependencies).
3. Run the SQL installation script (if provided in `install/` folder) to create necessary database tables.

## Configuration
- Set `Config.Framework` to `'esx'` or `'qbcore'` to match your server framework.
- `Config.MaxJobs` defines the maximum number of jobs a player can hold (default: 3).
- `Config.AllowJobSwitch` enables/disables the job switching feature via NUI.
- `Config.SwitchCooldown` sets the cooldown in seconds between job switches.
- `Config.OpenMenuKey` defines the key to open the multijob menu (default: `F6`).
- Alternatively, enable `Config.UseCommand` and set `Config.CommandName` to open via command.

### Discord Integration
- Enable Discord sync via `Config.Discord.Enabled`.
- Configure `Config.Discord.BotToken` and `Config.Discord.GuildId` with your bot credentials.
- Map Discord roles to jobs/grades in `Config.Discord.RoleMapping` (format: `['roleID'] = {job = 'police', grade = 0}`).
- `Config.Discord.AutoSync` automatically syncs jobs when players connect; `SyncInterval` controls the delay.
- Discord webhooks log job events (add/remove/switch) when `Config.Discord.LogEvents` is enabled.

### On-Duty System
- `Config.OnDutySystem` enables location-based duty toggle points.
- `Config.OnDutyJobs` lists which jobs require on-duty toggling.
- `Config.OnDutyLocations` defines marker positions per job (format: `{coords = vector4(x, y, z, h), radius = 2.5}`).
- Customize marker appearance via `Config.DutyMarker` settings.

### Job Management
- `Config.IgnoredJobs` lists jobs that won't count toward the job limit (e.g., `'unemployed'`).
- `Config.ExclusiveJobs` lists jobs that cannot be held simultaneously with other jobs.
- `Config.AdminGroups` defines which permission groups can manage jobs via admin commands.

### Additional Features
- `Config.TrackJobHistory` logs all job changes to the database.
- `Config.SavePreferences` remembers player's last active job on reconnect.
- `Config.ShowStatistics` displays job statistics in the NUI.

## Next steps
- Configure your notification system in `Config.Notify` (supports `ox_lib`, `fs_notify`, `okokNotify`, ESX, QBCore).
- Set up Discord bot permissions (requires "Manage Roles" and "Read Messages" permissions).
- Customize locales in `locales/` folder (available: `cs.lua`, `en.lua`).
- Update UI styling in `app/css/app.css` if needed.
