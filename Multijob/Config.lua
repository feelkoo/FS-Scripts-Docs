Config = {}

-- ============================================================================================
-- Global Settings
-- ============================================================================================
Config.Locale = 'en' -- Locale: 'cs' or 'en'
Config.Framework = 'esx' -- Framework: 'esx' or 'qbcore'
Config.Debug = false

-- ============================================================================================
-- Notifications Settings
-- ============================================================================================
Config.Notify = function(title, message, type, duration)
    --lib.notify({ title = title, description = message, type = type, position = 'top-right', duration = duration or 5000 })

    -- Just uncomment fsNotify export and comment lib.notify:
    exports['fs_notify']:SendNotification({ title = title, description = message, duration = duration or 5000, type = type, position = 'top-right' })

    -- okokNotify:
    -- exports['okokNotify']:Alert(title, message, duration or 3000, type, false)

    -- QBCore Notify:
    -- if Config.Framework == 'qbcore' then
    --     QBCore.Functions.Notify(message, type, duration or 5000)
    -- end

    -- ESX Notify:
    -- if Config.Framework == 'esx' then
    --     ESX.ShowNotification(message, type, duration or 5000)
    -- end
end

-- ============================================================================================
-- Discord Settings
-- ============================================================================================
Config.Discord = {
    Enabled = true,
    BotToken = 'Your Bot Token',
    GuildId = 'Your Discord server ID',

    AutoSync = true,
    SyncInterval = 1000,

    RoleMapping = { -- Role to Job mapping
        ['1433760183053582386'] = {job = 'police', grade = 0},
        ['1433395630260097044'] = {job = 'police', grade = 2},
        ['1433395832157372517'] = {job = 'ambulance', grade = 0},
        -- Add more mappings here
    },

    WebhookURL = 'Your Webhook Link',
    WebhookName = 'FS Multijob',
    WebhookAvatar = 'https://i.imgur.com/4M34hi2.png',

    LogEvents = {
        JobAdded = true,
        JobRemoved = true,
        JobSwitched = true,
        DiscordSync = true
    }
}

-- ============================================================================================
-- Multijob settings
-- ============================================================================================
Config.DefaultJob = 'unemployed'
Config.MaxJobs = 3
Config.AllowJobSwitch = true
Config.OnDutySystem = true
Config.UseCommand = false
Config.SwitchCooldown = 5
Config.OpenMenuKey = 'F6'
Config.CommandName = 'jobs'
Config.ButtonAvailableJobs = true

Config.AdminGroups = {
    'admin',
    'superadmin',
    'mod'
}

Config.IgnoredJobs = {
    'unemployed'
}

Config.ExclusiveJobs = {
    'police',
    'ambulance',
    'sheriff'
}

Config.OnDutyJobs = {
    'police',
    'ambulance',
    'sheriff',
    'mechanic'
}

Config.DutyToggleRadius = 3.0 -- Default radius for duty toggle points
Config.DutyMarker = {
    Type = 21, -- MarkerTypeChevronUpx2
    DrawDistance = 20.0,
    Height = 0.7,
    Scale = 0.7
}

Config.OnDutyLocations = {
    police = {
        {coords = vector4(1141.0577, -1621.1936, 33.65, 180.63), radius = 2.5}
    },
    ambulance = {
        {coords = vector4(306.23, -601.10, 43.28, 70.0), radius = 2.5}
    }
    -- Add more job-specific duty toggle locations here
}

-- ============================================================================================
-- Others Features
-- ============================================================================================
Config.TrackJobHistory = true
Config.SavePreferences = true
Config.ShowStatistics = true