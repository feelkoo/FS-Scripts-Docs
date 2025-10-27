Config = {}

-- ══════════════════════════════════════════════════════════════
--  Global Settings
-- ══════════════════════════════════════════════════════════════
Config.Locale = 'en' -- 'en' or 'cs'
Config.Framework = 'ESX' -- 'ESX' or 'QBCORE'
Config.QBCoreExport = 'qb-core' -- QBCore export name (Leave it by default)
Config.Inventory = 'ox_inventory' -- 'ox_inventory', 'qb-inventory', 'qs-inventory', 'core_inventory', 'quasar-inventory'
Config.Target = 'ox_target' -- 'ox_target', 'qb-target', 'qtarget', 'custom'
Config.Notifications = 'fs_notify' -- 'ESX', 'QBCORE', 'okokNotify', 'mythic_notify', 'ox_lib', 'fs_notify'
Config.ProgressBarType = 'ox_lib' -- 'ox_lib', 'progressBars', 'mythic_progbar',
Config.UseDatabase = true -- Save player crafting levels to database (You can turn off saving to db progress but i dont recommend it :))
Config.UI = { inventoryImagePath = 'nui://ox_inventory/web/images/',}

-- ══════════════════════════════════════════════════════════════
--  GENERAL SETTINGS
-- ══════════════════════════════════════════════════════════════
Config.EnableLevelSystem = true -- Enable XP and level progression
Config.EnableCraftingQueue = true -- Allow multiple items to be queued
Config.EnableBlueprints = true -- Require blueprints to unlock recipes
Config.EnableSuccessRate = true -- Crafting can fail based on level
Config.EnableFactionLock = true -- Allow recipes to be locked to factions/jobs
Config.EnableDiscordLogs = true -- Log crafting activities to Discord
Config.EnableSkillChecks = true -- Require skill checks during crafting (prevents AFK crafting)
Config.MassCraftPenalty = 1.5 -- Success rate penalty per extra item (percentage) / Example: Crafting 1 item = 100% success, 2 items = 98.5%, 10 items = 86.5%

Config.UseProgressBar = true -- Enable progress bar for crafting
Config.CraftingTime = 5000 -- Base crafting time in milliseconds (modified by item config)
Config.TargetIcon = 'fas fa-tools' -- Target interaction icon

Config.NotificationSettings = {
    title = 'FS - Crafting',
    position = 'top-right',
    duration = 5000
}

-- Level System Settings
Config.MaxLevel = 100 -- Maximum crafting level
Config.XPPerCraft = 10 -- Base XP gained per craft (modified by item config)
Config.XPMultiplier = 1.5 -- XP required increases by this multiplier each level
Config.BaseXPRequired = 180 -- XP required for level 1 -> 2

-- Success Rate Settings
Config.BaseSuccessRate = 50 -- Base success rate at level 1 (percentage)
Config.MaxSuccessRate = 100 -- Maximum success rate at high level
Config.LevelSuccessBonus = 0.5 -- Success rate increase per level (percentage)

-- Distance Settings
Config.TargetInteractionDistance = 2.0 -- Interaction distance for target system
Config.BlueprintUseDistance = 3.0 -- Maximum distance to bench when using blueprints

-- Skill Check Settings
Config.SkillCheckInterval = 10000 -- Interval between skill checks (milliseconds)
Config.SkillCheckFailuresAllowed = 5 -- Number of failed skill checks before crafting fails
Config.SkillCheckKeys = {'w', 'a', 's', 'd'} -- Keys used for skill checks

-- Skill Check Difficulty Based on Recipe Level
-- The system automatically selects difficulty based on the recipe's levelRequired
Config.SkillCheckDifficulty = {
    {minLevel = 0,  maxLevel = 14,  difficulty = {'easy', 'easy', 'medium'}},
    {minLevel = 15, maxLevel = 29,  difficulty = {'easy', 'medium', 'medium'}},
    {minLevel = 30, maxLevel = 49,  difficulty = {'medium', 'medium', 'hard'}},
    {minLevel = 50, maxLevel = 999, difficulty = {'medium', 'hard', 'hard'}},
}

-- Discord Webhook Settings
Config.AdminWebhook = 'https://discord.com/api/webhooks/1429418606613233755/T5sc5x03pcT6Gv5G1NKnv8Wylp614M3eB4hqFR_R23qA7x6K-vUGF5Fji_M-TLMMw7LK' -- Admin webhook (shows all crafts with player identifiers)
Config.DiscordBotName = 'FS Crafting'
Config.DiscordColor = 3447003 -- Blue color (default)
Config.DiscordColors = {
    success = 3066993,   -- Green color for successful crafts
    failure = 15158332,  -- Red color for failed crafts
    blueprint = 3447003  -- Blue color for blueprint usage
}
Config.LogWeapons = true -- Log weapon crafts
Config.LogRareItems = true -- Log rare/expensive item crafts
Config.LogFailedCrafts = false -- Log failed crafting attempts

-- ══════════════════════════════════════════════════════════════
--  CRAFTING CATEGORIES & RECIPES
-- ══════════════════════════════════════════════════════════════
Config.Categories = {
    {
        name = 'weapons',
        label = 'Weapons',
        icon = 'fas fa-gun',
        color = '#e74c3c',
        description = 'Craft weapons',
        levelRequired = 1,
    },
    {
        name = 'attachments',
        label = 'Attachments',
        icon = 'fas fa-screwdriver-wrench',
        color = '#f39c12',
        description = 'Craft weapon attachments',
        levelRequired = 1,
    },
    {
        name = 'ammo',
        label = 'Ammunition',
        icon = 'fas fa-circle-dot',
        color = '#95a5a6',
        description = 'Craft ammunition',
        levelRequired = 1,
    },
    {
        name = 'drugs',
        label = 'Drugs',
        icon = 'fas fa-pills',
        color = '#9b59b6',
        description = 'Process and create substances',
        levelRequired = 1,
    },
    {
        name = 'drugs_others',
        label = 'Others',
        icon = 'fas fa-pills',
        color = '#b659a2ff',
        description = 'Others items for drugs',
        levelRequired = 1,
    },    
}

-- ══════════════════════════════════════════════════════════════
--  CRAFTING BENCHES / LOCATIONS
-- ══════════════════════════════════════════════════════════════
Config.CraftingBenches = {
    {
        name = 'weapons_bench',
        coords = vector3(606.5341, -3087.8088, 6.0693),
        radius = 1.5,
        categories = {'weapons', 'attachments', 'ammo'}, -- Multiple categories shown in this bench
        label = 'Weapons Crafting',
        description = 'Craft weapons, attachments and ammunition',
        icon = 'fas fa-gun', -- FontAwesome icon
        blip = {
            enabled = false,
            sprite = 110,
            color = 1,
            scale = 0.8,
            label = 'Weapons Crafting'
        },
        jobs = {}, -- Empty = everyone can use, or {'police', 'mechanic'}
        gangs = {}, -- For gang restrictions (QBCore)
        requiredItem = nil, -- Item required in inventory to use bench
        webhook = '', -- Custom Discord webhook for this bench (leave empty to use global Config.DiscordWebhook)
    },
    {
        name = 'drugs_bench',
        coords = vector3(606.7184, -3092.5872, 6.0693),
        radius = 1.5,
        categories = {'drugs', 'drugs_others'},
        label = 'Drugs Crafting',
        description = 'Craft drugs',
        icon = 'fas fa-cannabis',
        blip = {
            enabled = false,
            sprite = 110,
            color = 1,
            scale = 0.8,
            label = 'Drugs Crafting'
        },
        jobs = {},
        gangs = {},
        requiredItem = nil,
        webhook = '',
    },       
}

-- ══════════════════════════════════════════════════════════════
--  RECIPES
-- ══════════════════════════════════════════════════════════════
Config.Recipes = {
    {
        category = 'weapons',
        result = 'weapon_pistol',
        resultLabel = 'Pistol',
        resultAmount = 1,
        resultImage = 'weapon_pistol.png',
        description = 'A basic semi-automatic pistol for self-defense.',
        craftTime = 15000, -- ms
        levelRequired = 0,
        xpGained = 50,
        successRate = 100, -- Overrides calculated rate (optional)
        jobs = {}, -- Empty = everyone can use, or {'police', 'mechanic'}
        gangs = {}, -- For gang restrictions (QBCore)
        ingredients = {
            {item = 'steel_parts', amount = 10, label = 'Steel Parts'},
            {item = 'plastic', amount = 5, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false, -- Requires 'blueprint_pistol' item
    },
    {
        category = 'weapons',
        result = 'weapon_pistol50',
        resultLabel = 'Pistol .50',
        resultAmount = 1,
        resultImage = 'weapon_pistol50.png',
        description = 'High-caliber powerful pistol with increased damage.',
        craftTime = 20000,
        levelRequired = 15,
        xpGained = 100,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 10, label = 'Steel Parts'},
            {item = 'plastic', amount = 5, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    },
    {
        category = 'weapons',
        result = 'weapon_combatpdw',
        resultLabel = 'CombatPDW',
        resultAmount = 1,
        resultImage = 'weapon_combatpdw.png',
        description = 'High-caliber powerful SMG with increased damage.',
        craftTime = 20000,
        levelRequired = 15,
        xpGained = 100,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 10, label = 'Steel Parts'},
            {item = 'plastic', amount = 5, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'weapons',
        result = 'weapon_smg',
        resultLabel = 'SMG',
        resultAmount = 1,
        resultImage = 'weapon_smg.png',
        description = 'High-caliber powerful SMG with increased damage.',
        craftTime = 10000,
        levelRequired = 2,
        xpGained = 100,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 10, label = 'Steel Parts'},
            {item = 'plastic', amount = 5, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = true,
    },       
    {
        category = 'weapons',
        result = 'weapon_assaultrifle',
        resultLabel = 'Assault Rifle',
        resultAmount = 1,
        resultImage = 'weapon_assaultrifle.png',
        description = 'High-caliber powerful Assault Rifle with increased damage.',
        craftTime = 100000,
        levelRequired = 2,
        xpGained = 100,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 10, label = 'Steel Parts'},
            {item = 'plastic', amount = 5, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = true,
    },            
    {
        category = 'attachments',
        result = 'at_clip_extended_pistol',
        resultLabel = 'Ext. Clip',
        resultAmount = 1,
        resultImage = 'at_clip_extended.png',
        description = 'Extended Clip for Pistols',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 1,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    },
    {
        category = 'attachments',
        result = 'at_grip',
        resultLabel = 'Grip',
        resultAmount = 1,
        resultImage = 'at_grip.png',
        description = 'Grip for weapons',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 100,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'ammo',
        result = 'ammo-9',
        resultLabel = 'Ammo .9mm',
        resultAmount = 1,
        resultImage = 'ammo-9.png',
        description = 'Ammo for .9mm weapons',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 92,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'ammo',
        result = 'ammo-50',
        resultLabel = 'Ammo .50 APC',
        resultAmount = 1,
        resultImage = 'ammo-50.png',
        description = 'Ammo for .50 APC weapons',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 92,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'drugs',
        result = 'cocaine_baggy',
        resultLabel = 'Cocaine Baggy',
        resultAmount = 1,
        resultImage = 'cocaine_baggy.png',
        description = 'Baggy of Cocaine',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 80,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'drugs',
        result = 'meth_baggy',
        resultLabel = 'Metamfetamin Baggy',
        resultAmount = 1,
        resultImage = 'meth_baggy.png',
        description = 'Baggy of Metamfetamin',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 85,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'drugs',
        result = 'baggy_weed',
        resultLabel = 'Weed Baggy',
        resultAmount = 1,
        resultImage = 'baggy_weed.png',
        description = 'Baggy of Weed',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 75,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    }, 
    {
        category = 'drugs_others',
        result = 'banana_kush_weed',
        resultLabel = 'Bannana Kush Weed',
        resultAmount = 1,
        resultImage = 'banana_kush_weed.png',
        description = 'Bannana Kush Weed',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 55,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},
        },
        requiresBlueprint = false,
    },
    {
        category = 'drugs_others',
        result = 'weed_ak47_bud',
        resultLabel = 'AK47 Bud Weed',
        resultAmount = 1,
        resultImage = 'weed_ak47_bud.png',
        description = 'AK47 Bud Weed',
        craftTime = 5000,
        levelRequired = 0,
        xpGained = 50,
        successRate = 45,
        jobs = {},
        gangs = {},
        ingredients = {
            {item = 'steel_parts', amount = 3, label = 'Steel Parts'},
            {item = 'plastic', amount = 3, label = 'Plastic'},
            {item = 'spring', amount = 3, label = 'Springs'},       
        },
        requiresBlueprint = false,
    },                          
}

-- ══════════════════════════════════════════════════════════════
--  KEYBINDS
-- ══════════════════════════════════════════════════════════════
Config.Keybinds = {
    closeUI = 'ESC',
}