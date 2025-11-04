Config = {}
Locales = {}

-- ============================================================================================
-- CONFIGURABLE GAME PARAMETERS - You can modify these
-- ============================================================================================
Config.Framework = 'esx' -- Options: 'esx' or 'qbcore'
Config.Locale = 'en' -- Options: 'en' (English), 'cs' (Czech)

Config.ESX = {
    SharedObject = 'esx:getSharedObject' -- ESX shared object event
}

Config.QBCore = {
    CoreName = 'qb-core' -- QBCore export name
}

Config.ClientNotification = function(type, title, description)
    -- ► ox_lib (default)
    exports['ox_lib']:notify({type = type, title = title, description = description, duration = 5000, position = 'top-right'})

    -- ► fs_notify
    --exports['fs_notify']:SendNotification({type = type, title = title, description = description, duration = 5000, position = 'top-right'})

    -- ► okokNotify
    --exports['okokNotify']:Alert(title, description, 5000, type)

    -- ► ESX Default
    -- ESX.ShowNotification(description)

    -- ► QBCore
    -- QBCore.Functions.Notify(description, type, 5000)
end

-- ========================================
-- SERVER-SIDE NOTIFICATION FUNCTIONS
-- ========================================
-- These functions handle server-to-client notifications
-- Usually you don't need to modify these, but you can if needed but mostly not.
-- ========================================
Config.ServerNotification = function(source, type, title, description)
    -- This triggers the client notification on the specified player
    -- You can modify this if you want server-side only notifications
    TriggerClientEvent('fs_chat:notify', source, type, title, description)
end

Config.ServerNotificationAll = function(type, title, description)
    -- This triggers the client notification on all players
    -- You can modify this if you want server-side only notifications for all
    TriggerClientEvent('fs_chat:notify', -1, type, title, description)
end

-- ========================================
-- ADMIN PERMISSIONS (Groups)
-- ========================================
Config.AdminGroups = {
    'owner',
    'admin',
    'superadmin',
    'mod',
    'moderator'
}

-- ============================================================================================
-- Chat Settings - You can modify these
-- ============================================================================================
Config.ChatSettings = {
    MaxMessages = 10, -- Maximum messages displayed at once
    MessageDuration = 20000, -- Time messages stay visible (milliseconds) - 30 seconds
    FadeAnimation = true, -- Enable fade out animation
    EnableSound = true, -- Enable message sound effect
    MaxCharacters = 256, -- Maximum characters per message
    ShowPlayerID = true, -- Master switch - enable/disable player IDs completely
    ShowIDToAll = false, -- true = everyone sees IDs, false = only admins see IDs (clickable for /pm)
}

Config.ProximityRanges = {
    normal = 20.0, -- Normal talking distance
    shout = 40.0, -- Shouting distance (future feature)
    whisper = 5.0 -- Whisper distance (future feature)
}

-- ========================================
-- IC NAME DISPLAY SETTINGS (Anti-Metagaming)
-- ========================================
-- Controls how player names are displayed in IC commands (/me, /do, /try, etc.)
-- Options:
--   'full'       - Full name (e.g., "John Snow")
--   'firstname'  - First name only (e.g., "John")
--   'initial'    - First letter + dot (e.g., "J.")
--   'id'         - Player ID only (e.g., "[42]")
Config.ICNameDisplay = 'firstname' -- Change this to your preferred display mode

-- ========================================
-- 3D TEXT SETTINGS
-- ========================================
-- Show 3D text above player's head for IC commands
Config.Enable3DText = true -- Enable/disable 3D text above head
Config.ThreeDText = {
    DrawDistance = 50.0, -- Max distance to see 3D text (in meters)
    DisplayTime = 5000, -- How long text stays visible (milliseconds) - for /me, /do, etc.
    Font = 0, -- GTA font ID (0-7)
    Scale = 0.35, -- Text size
    Color = {r = 255, g = 255, b = 255, a = 215}, -- Text color (RGBA)
    BackgroundColor = {r = 0, g = 0, b = 0, a = 100}, -- Background color (RGBA)
    EnabledCommands = {'me', 'do', 'melow', 'dolow', 'try', 'trylow', 'roll', 'coin', 'status'} -- Which commands show 3D text
}

-- ========================================
-- STATUS SETTINGS (Persistent 3D Text)
-- ========================================
-- /status command shows persistent text above player's head (e.g., "injured", "wounded leg")
Config.EnableStatus = true -- Enable/disable /status command
Config.Status = {
    Duration = 600000, -- How long status stays visible (milliseconds) - default 10 minutes
    DrawDistance = 30.0, -- Max distance to see status text (in meters)
    Font = 4, -- GTA font ID (0-7) - Font 4 is smaller/cleaner for persistent text
    Scale = 0.3, -- Text size (smaller than regular 3D text)
    Color = {r = 255, g = 200, b = 100, a = 200}, -- Status text color (yellowish)
    BackgroundColor = {r = 0, g = 0, b = 0, a = 80}, -- Background color
    MaxLength = 50, -- Max characters for status message
    ShowInChat = true, -- Also show status change in chat
    AllowClear = true -- Allow /clearstatus to remove status early
}

Config.AntiSpam = {
    enabled = true,
    maxMessages = 3, -- Max messages in time window
    timeWindow = 5000, -- Time window in milliseconds (5 seconds)
    muteTime = 30000 -- Mute duration in milliseconds (30 seconds)
}

-- ========================================
-- CHAT BADGES/TAGS SYSTEM
-- ========================================
Config.Badges = {
    enabled = true, -- Master switch for all badges

    -- Define badges
    -- Priority: higher number = displayed first (if player has multiple badges)
    badges = {
        {
            name = 'owner',
            label = 'OWNER',
            icon = 'fa-crown',
            color = '#fbbf24', -- Gold
            groups = {'owner'}, -- ESX/QB groups
            priority = 100,
            enabled = true
        },
        {
            name = 'admin',
            label = 'ADMIN',
            icon = 'fa-shield-alt',
            color = '#ef4444', -- Red
            groups = {'admin', 'superadmin'},
            priority = 90,
            enabled = true
        },
        {
            name = 'moderator',
            label = 'MOD',
            icon = 'fa-gavel',
            color = '#3b82f6', -- Blue
            groups = {'mod', 'moderator'},
            priority = 80,
            enabled = true
        },
        {
            name = 'vip',
            label = 'VIP',
            icon = 'fa-star',
            color = '#a855f7', -- Purple
            groups = {'vip'},
            priority = 70,
            enabled = true
        },
        {
            name = 'developer',
            label = 'DEV',
            icon = 'fa-code',
            color = '#10b981', -- Green
            groups = {'developer', 'dev'},
            priority = 95,
            enabled = true
        }
    }
}

-- ========================================
-- AUTO MESSAGE SYSTEM
-- ========================================
Config.AutoMessages = {
    enabled = true,
    interval = 60000, -- Time between messages in milliseconds (10 minutes)
    randomOrder = false, -- true = random order, false = sequential

    messages = {
        {
            message = 'Text example of auto messages',
            icon = 'fa-brands fa-discord',
            color = '#5865F2'
        },
        {
            message = 'Text example of auto messages',
            icon = 'fa-book',
            color = '#3b82f6'
        },
        {
            message = 'Text example of auto messages',
            icon = 'fa-question-circle',
            color = '#f59e0b'
        },
        {
            message = 'Text example of auto messages',
            icon = 'fa-heart',
            color = '#ec4899'
        }
    }
}

-- ========================================
-- UTILITY COMMANDS (shown in suggestions)
-- ========================================
Config.UtilityCommands = {
    {
        name = 'clear',
        description = 'Clear your chat messages',
        icon = 'fa-eraser',
        iconColor = '#6366f1',
        color = '#6366f1'
    },
    {
        name = 'hide',
        description = 'Toggle chat visibility',
        icon = 'fa-eye-slash',
        iconColor = '#8b5cf6',
        color = '#8b5cf6'
    },
    {
        name = 'pm',
        description = 'Send private message (Usage: /pm [id] [message])',
        icon = 'fa-envelope',
        iconColor = '#ec4899',
        color = '#ec4899'
    }
}

Config.DiscordWebhook = {
    enabled = true, -- Master switch for all webhooks
    logCommands = true, -- Log all commands to Discord

    -- Discord embed fields format (global for all webhooks)
    embedFields = {
        player = {
            name = 'Player',
            inline = false
        },
        steam = {
            name = 'Steam',
            inline = false
        },
        discord = {
            name = 'Discord',
            inline = false
        }
    },

    -- Timestamp (global)
    includeTimestamp = true, -- Include timestamp in Discord embed

    -- ========================================
    -- MULTIPLE WEBHOOKS CONFIGURATION
    -- ========================================
    -- You can add up to as many webhooks as you want
    -- Each webhook can log specific message types
    webhooks = {
        -- Webhook 1: General Chat (OOC, IC, ME, DO, TRY)
        {
            enabled = true,
            name = 'General Chat',
            url = 'Your Webhook Link',
            webhookName = 'FS Chat - General', -- Name shown in Discord
            webhookAvatar = 'https://i.imgur.com/4M34hi2.png', -- Avatar URL (optional)
            footerText = 'General Chat', -- Footer text
            footerIcon = '', -- Footer icon URL (optional)
            logTypes = {'ooc', 'me', 'do', 'try', 'pm', 'anonymous', 'ad', 'announce'} -- Which message types this webhook logs
        },

        -- Webhook 2: Emergency Services (Police, EMS, DOC)
        {
            enabled = true,
            name = 'Emergency Services',
            url = 'Your Webhook Link', -- Add your webhook URL here
            webhookName = 'FS Chat - Emergency',
            webhookAvatar = 'https://i.imgur.com/police-icon.png',
            footerText = 'Emergency Services',
            footerIcon = '',
            logTypes = {'police', 'ems', 'doc'}
        },

        -- Webhook 3: Jobs (Mechanic, Taxi, Job)
        {
            enabled = false, -- Disabled by default
            name = 'Jobs',
            url = '', -- Add your webhook URL here
            webhookName = 'FS Chat - Jobs',
            webhookAvatar = '',
            footerText = 'Job Chat',
            footerIcon = '',
            logTypes = {'mechanic', 'taxi', 'job'}
        },

        -- Webhook 4: Social Media (Twitter, Twitch, YouTube)
        {
            enabled = false,
            name = 'Social Media',
            url = '', -- Add your webhook URL here
            webhookName = 'FS Chat - Social',
            webhookAvatar = '',
            footerText = 'Social Media',
            footerIcon = '',
            logTypes = {'twitter', 'twitch', 'youtube'}
        }

        -- You can add more webhooks here following the same format...
    }
}

-- ========================================
-- MESSAGE TYPES & COLORS
-- ========================================
Config.MessageTypes = {
    ooc = {
        icon = 'fa-comment',
        color = '#3b82f6',
        iconColor = '#2563eb',
        label = 'OOC',
        format = '{player}: {message}'
    },
    me = {
        icon = 'fa-user-circle',
        color = '#8b5cf6',
        iconColor = '#7c3aed',
        label = 'ME',
        format = '{player}: {message}'
    },
    ["do"] = {
        icon = 'fa-book',
        color = '#f59e0b',
        iconColor = '#d97706',
        label = 'DO',
        format = '{player}: {message}'
    },
    doc = {
        icon = 'fa-file-medical',
        color = '#ef4444',
        iconColor = '#dc2626',
        label = 'DOC',
        format = '[DOC] {message}'
    },
    system = {
        icon = 'fa-server',
        color = '#6366f1',
        iconColor = '#4f46e5',
        label = 'SYSTEM',
        format = '[SYSTEM] {message}'
    },
    announce = {
        icon = 'fa-bullhorn',
        color = '#ec2424ff',
        iconColor = '#ec2424ff',
        label = 'Server',
        format = '[SERVER] {message}'
    },
    staff = {
        icon = 'fa-user-shield',
        color = '#8b5cf6',
        iconColor = '#7c3aed',
        label = 'STAFF',
        format = '{player}: {message}'
    },
    police = {
        icon = 'fa-shield-alt',
        color = '#3b82f6',
        iconColor = '#2563eb',
        label = 'POLICE',
        format = '[POLICE] {message}'
    },
    ems = {
        icon = 'fa-ambulance',
        color = '#ef4444',
        iconColor = '#dc2626',
        label = 'EMS',
        format = '[EMS] {message}'
    },
    mechanic = {
        icon = 'fa-wrench',
        color = '#f59e0b',
        iconColor = '#d97706',
        label = 'MECHANIC',
        format = '[MECHANIC] {message}'
    },
    taxi = {
        icon = 'fa-taxi',
        color = '#eab308',
        iconColor = '#ca8a04',
        label = 'TAXI',
        format = '[TAXI] {message}'
    },
    try = {
        icon = 'fa-dice',
        color = '#a855f7',
        iconColor = '#9333ea',
        label = 'TRY',
        format = '{player} {message}'
    },
    melow = {
        icon = 'fa-user-circle',
        color = '#6b7280',
        iconColor = '#4b5563',
        label = 'ME',
        format = '{player} (quietly): {message}'
    },
    dolow = {
        icon = 'fa-book',
        color = '#78716c',
        iconColor = '#57534e',
        label = 'DO',
        format = '{player} (quietly): {message}'
    },
    trylow = {
        icon = 'fa-dice',
        color = '#71717a',
        iconColor = '#52525b',
        label = 'TRY',
        format = '{player} (quietly) {message}'
    },
    roll = {
        icon = 'fa-dice-d20',
        color = '#14b8a6',
        iconColor = '#0d9488',
        label = 'ROLL',
        format = '{player} {message}'
    },
    coin = {
        icon = 'fa-coins',
        color = '#f59e0b',
        iconColor = '#d97706',
        label = 'COIN',
        format = '{player} {message}'
    },
    status = {
        icon = 'fa-user-injured',
        color = '#fbbf24',
        iconColor = '#f59e0b',
        label = 'STATUS',
        format = '{player} sets status: {message}'
    },
    clearstatus = {
        icon = 'fa-times-circle',
        color = '#6b7280',
        iconColor = '#4b5563',
        label = 'STATUS',
        format = '{player} cleared their status'
    },
    twitter = {
        icon = 'fa-brands fa-twitter',
        color = '#1da1f2',
        iconColor = '#0c85d0',
        label = 'TWITTER',
        format = '@{player}: {message}'
    },
    twitch = {
        icon = 'fa-brands fa-twitch',
        color = '#9146ff',
        iconColor = '#7928e0',
        label = 'TWITCH',
        format = '{player}: {message}'
    },
    youtube = {
        icon = 'fa-brands fa-youtube',
        color = '#ff0000',
        iconColor = '#cc0000',
        label = 'YOUTUBE',
        format = '{player}: {message}'
    },
    ad = {
        icon = 'fa-ad',
        color = '#22c55e',
        iconColor = '#16a34a',
        label = 'AD',
        format = '[ADVERTISEMENT] {message}'
    },
    anonymous = {
        icon = 'fa-user-secret',
        color = '#6b7280',
        iconColor = '#4b5563',
        label = 'ANONYMOUS',
        format = '[ANONYMOUS] {message}'
    },
    job = {
        icon = 'fa-briefcase',
        color = '#06b6d4',
        iconColor = '#0891b2',
        label = 'JOB',
        format = '{player}: {message}'
    },
    pm = {
        icon = 'fa-envelope',
        color = '#f472b6',
        iconColor = '#ec4899',
        label = 'PM',
        format = '{message}'
    }
}

-- ========================================
-- COMMANDS CONFIGURATION
-- ========================================
Config.Commands = {
    {
        enabled = true,
        name = 'ooc',
        description = 'Send an Out of Character message',
        type = 'ooc',
        restricted = false,
        allowedJobs = {},
        distance = -1
    },
    {
        enabled = true,
        name = 'me',
        description = 'Describe your action',
        type = 'me',
        restricted = false,
        allowedJobs = {},
        distance = 20.0 -- Players within 20 units can see
    },
    {
        enabled = true,
        name = 'do',
        description = 'Describe the environment or situation',
        type = 'do',
        restricted = false,
        allowedJobs = {},
        distance = 20.0
    },
    {
        enabled = true,
        name = 'doc',
        description = 'Emergency medical announcement',
        type = 'doc',
        restricted = true,
        allowedJobs = {'ambulance', 'doctor'}, -- ESX/QB job names
        distance = -1 -- Global
    },
    {
        enabled = true,
        name = 'police',
        description = 'Police department announcement',
        type = 'police',
        restricted = true,
        allowedJobs = {'police', 'sheriff'},
        distance = -1
    },
    {
        enabled = true,
        name = 'ems',
        description = 'EMS department announcement',
        type = 'ems',
        restricted = true,
        allowedJobs = {'ambulance', 'doctor'},
        distance = -1
    },
    {
        enabled = true,
        name = 'mechanic',
        description = 'Mechanic announcement',
        type = 'mechanic',
        restricted = true,
        allowedJobs = {'mechanic'},
        distance = -1
    },
    {
        enabled = true,
        name = 'taxi',
        description = 'Taxi announcement',
        type = 'taxi',
        restricted = true,
        allowedJobs = {'taxi'},
        distance = -1
    },
    {
        enabled = true,
        name = 'try',
        description = 'Try an action (random success/fail)',
        type = 'try',
        restricted = false,
        allowedJobs = {},
        distance = 20.0
    },
    {
        enabled = true,
        name = 'melow',
        description = 'Describe your action (whisper - short range)',
        type = 'melow',
        restricted = false,
        allowedJobs = {},
        distance = 5.0 -- Whisper distance
    },
    {
        enabled = true,
        name = 'dolow',
        description = 'Describe the environment (whisper - short range)',
        type = 'dolow',
        restricted = false,
        allowedJobs = {},
        distance = 5.0 -- Whisper distance
    },
    {
        enabled = true,
        name = 'trylow',
        description = 'Try an action quietly (whisper - short range)',
        type = 'trylow',
        restricted = false,
        allowedJobs = {},
        distance = 5.0 -- Whisper distance
    },
    {
        enabled = true,
        name = 'roll',
        description = 'Roll a dice (usage: /roll or /roll 20 for d20)',
        type = 'roll',
        restricted = false,
        allowedJobs = {},
        distance = 20.0
    },
    {
        enabled = true,
        name = 'coin',
        description = 'Flip a coin (heads or tails)',
        type = 'coin',
        restricted = false,
        allowedJobs = {},
        distance = 20.0
    },
    {
        enabled = true,
        name = 'status',
        description = 'Set a status above your head (e.g., /status injured)',
        type = 'status',
        restricted = false,
        allowedJobs = {},
        distance = -1 -- Not proximity-based, handled specially
    },
    {
        enabled = true,
        name = 'clearstatus',
        description = 'Clear your current status',
        type = 'clearstatus',
        restricted = false,
        allowedJobs = {},
        distance = -1
    },
    {
        enabled = true,
        name = 'twitter',
        description = 'Send a Twitter message',
        type = 'twitter',
        restricted = false,
        allowedJobs = {},
        distance = -1,
        allowedUsers = {} -- Empty = everyone, or add steam/license IDs
    },
    {
        enabled = true,
        name = 'twitch',
        description = 'Send a Twitch announcement',
        type = 'twitch',
        restricted = false,
        allowedJobs = {},
        distance = -1,
        allowedUsers = {}
    },
    {
        enabled = true,
        name = 'youtube',
        description = 'Send a YouTube announcement',
        type = 'youtube',
        restricted = false,
        allowedJobs = {},
        distance = -1,
        allowedUsers = {}
    },
    {
        enabled = true,
        name = 'ad',
        description = 'Place an advertisement',
        type = 'ad',
        restricted = false,
        allowedJobs = {},
        distance = -1,
        price = 500, -- Cost to use
        cooldown = 300000 -- 5 minutes cooldown (milliseconds)
    },
    {
        enabled = true,
        name = 'anonymous',
        description = 'Send an anonymous message',
        type = 'anonymous',
        restricted = false,
        allowedJobs = {},
        distance = -1,
        price = 1000,
        cooldown = 600000, -- 10 minutes
        blockedJobs = {'police', 'sheriff'} -- Jobs that can't see anonymous messages
    },
    {
        enabled = true,
        name = 'job',
        description = 'Send a job message',
        type = 'job',
        restricted = false,
        allowedJobs = {},
        distance = -1
    },
    {
        enabled = true,
        name = 'announce',
        description = 'Server announcement (admin only)',
        type = 'announce',
        restricted = true,
        allowedJobs = {},
        requireAdmin = true,
        distance = -1
    },
    {
        enabled = true,
        name = 'staff',
        description = 'Staff only chat',
        type = 'staff',
        restricted = true,
        allowedJobs = {},
        requireAdmin = true,
        distance = -1
    },
    {
        enabled = true,
        name = 'cash',
        description = 'Check your cash balance',
        type = 'system',
        restricted = false,
        allowedJobs = {},
        distance = -1
    },
    {
        enabled = true,
        name = 'bank',
        description = 'Check your bank balance',
        type = 'system',
        restricted = false,
        allowedJobs = {},
        distance = -1
    },
    {
        enabled = true,
        name = 'showid',
        description = 'Show your ID card to nearby players',
        type = 'system',
        restricted = false,
        allowedJobs = {},
        distance = 5.0
    },
    {
        enabled = true,
        name = 'showlicense',
        description = 'Show your license to nearby players',
        type = 'system',
        restricted = false,
        allowedJobs = {},
        distance = 5.0
    }
}