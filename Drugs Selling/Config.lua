Config = {}

-- ============================================================================================
-- Framework & System Settings
-- ============================================================================================
Config.Locale = 'en'
Config.Framework = 'ESX' -- 'ESX' or 'QB'
Config.Inventory = 'ox_inventory' -- 'ox_inventory', 'qb-inventory', 'ps-inventory', 'qs-inventory'
Config.Target = 'ox_target' -- 'ox_target' or 'qb-target'
Config.MoneyType = 'cash' -- For QBCore: 'cash', 'money', 'bank' | For ESX: uses regular money

-- ============================================================================================
-- Settings
-- ============================================================================================
Config.TargetLabel = "Sell drugs"
Config.TargetIcon = "fas fa-cannabis"
Config.InteractionDistance = 2.0
Config.SellCooldown = 10
Config.NPCCooldown = 180
Config.CallPoliceChance = 100 -- When NPC decline
Config.MinPoliceOnline = 0

-- ============================================================================================
-- Leveling system
-- ============================================================================================
Config.Leveling = {
    enabled = true,                 -- Turn on/off leveling system
    maxLevel = 100,                 -- Maximum level
    xpPerSale = 50,                 -- How much XP a player gets for selling drugs
    xpRequiredBase = 200,           -- Basic XP needed for level 2
    xpMultiplier = 1.1,             -- XP multiplier for each additional level (1.1 = +10% XP for the next level)
    priceIncreasePerLevel = 1,      -- Percentage price increase for each level (1 = 1%)
    showLevelUpNotification = true, -- Show notification when level up
    showXPGainNotification = false, -- Show notification when XP is gained
    lockedDrugIcon = "fa-solid fa-lock" -- Icon for locked drug
}

-- ============================================================================================
-- 24H Limit system
-- ============================================================================================
Config.DailyLimit = {
    enabled = true,
    maxSales = 100, -- Maximum number of sales in 24 hours
    resetTime = 0.05, -- Time to reset in hours
    showRemainingNotification = true -- Show how many sales are left
}

-- ============================================================================================
-- Prop system when passing
-- ============================================================================================
Config.UsePropSystem = true
Config.Props = {
    player = {
        model = `prop_weed_bottle`,
        bone = 28422,
        offset = vector3(0.0, 0.0, 0.05),
        rotation = vector3(0.0, 0.0, 0.0)
    },

    npc = {
        model = `hei_prop_heist_cash_pile`,
        bone = 28422,
        offset = vector3(0.0, 0.0, 0.05),
        rotation = vector3(0.0, 0.0, 0.0)
    },
    duration = 3000
}

-- ============================================================================================
-- Departments / Dispatch
-- ============================================================================================
Config.PoliceJobs = {
    'police',
    'sheriff'
}

Config.UseDispatch = true
Config.DispatchSettings = {
    code = "10-31",
    title = "10-31 - Suspicious drug sale",
    message = "A citizen reported suspicious activity related to drug sales",
    job_table = {'police', 'sheriff'},

    blip = {
        sprite = 514,
        scale = 1.2,
        colour = 1,
        flashes = true,
        text = "Selling drugs",
        time = 1,
        radius = 50,
    },

    sound = 1,
    flash = 0,
}

-- This function is called when police are alerted about drug activity
-- Customize this function to work with your dispatch system
-- Parameters:
--   coords - vector3 coordinates of the event
--   streetName - name of the street where event occurred
--   playerName - name of the player involved
Config.CustomDispatch = function(coords, streetName, playerName)
    -- EXAMPLE FOR cd_dispatch (DEFAULT):
    local dispatchData = {
        job_table = Config.DispatchSettings.job_table,
        coords = coords,
        title = Config.DispatchSettings.title,
        message = 'A citizen reported suspicious activity related to drug sales' .. streetName,
        flash = 0,
        unique_id = tostring(math.random(10000, 99999)),
        sound = 1,
        blip = {
            sprite = Config.DispatchSettings.blip.sprite,
            scale = Config.DispatchSettings.blip.scale,
            colour = Config.DispatchSettings.blip.colour,
            flashes = Config.DispatchSettings.blip.flashes,
            text = Config.DispatchSettings.blip.text,
            time = Config.DispatchSettings.blip.time,
            radius = 0,
        }
    }
    TriggerServerEvent('cd_dispatch:AddNotification', dispatchData)

    -- EXAMPLE FOR ps-dispatch:
    -- exports['ps-dispatch']:DrugSale()

    -- EXAMPLE FOR core_dispatch:
    -- exports['core_dispatch']:addCall(
    --     Config.DispatchSettings.code,
    --     Config.DispatchSettings.title,
    --     {{icon = 'fa-cannabis', info = streetName}},
    --     {coords[1], coords[2], coords[3]},
    --     Config.DispatchSettings.job_table,
    --     5000,
    --     Config.DispatchSettings.blip.sprite,
    --     Config.DispatchSettings.blip.colour
    -- )

    -- EXAMPLE FOR qs-dispatch:
    -- exports['qs-dispatch']:DrugSale()

    -- CUSTOM DISPATCH - Replace with your dispatch export/event:
    -- TriggerServerEvent('your_dispatch:event', coords, streetName)
end

-- ============================================================================================
-- Custom Notification Functions
-- ============================================================================================
Config.Notify = function(title, message, type, duration)
    lib.notify({ title = title, description = message, type = type, position = 'top-right', duration = duration or 5000 })

    -- Just uncomment fsNotify export and comment lib.notify:
    -- exports['fs_notify']:SendNotification({ title = title, description = message, duration = 5000, type = type, position = 'top-right' })

    -- Just uncomment okokNotify export and comment lib.notify:
    -- exports['okokNotify']:Alert(title, message, 3000, type, playSound)
    
    -- Etc...
end

-- ============================================================================================
-- Special zones with higher prices (rotating)
-- ============================================================================================
Config.HotZones = {
    enabled = true,
    rotationTime = 1, -- Zone rotation time in minutes (minutes)
    priceMultiplier = 1.5,
    showBlip = true,
    showNotification = false,
    
    blip = {
        sprite = 51,
        color = 2,      
        scale = 1.2,
        alpha = 255
    },
    
    zones = {
        {
            name = "Location 1",
            coords = vector3(-1123.1975, -514.1649, 34.3074),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 2",
            coords = vector3(-545.2250, 130.1242, 63.0718),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 3",
            coords = vector3(-1958.1904, 323.3929, 89.6719),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 4",
            coords = vector3(-1209.9310, -1544.4460, 4.3601),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 5",
            coords = vector3(-28.2510, -1609.9009, 29.2920),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 6",
            coords = vector3(1679.0715, 4767.4087, 41.9892),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 7",
            coords = vector3(601.8879, 2692.9365, 41.4604),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 8",
            coords = vector3(-175.0031, 6363.1528, 31.4300),
            radius = 100.0,
            description = "secret"
        },   
        {
            name = "Location 9",
            coords = vector3(66.4891, 3696.0120, 39.7550),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 10",
            coords = vector3(-1098.8523, 4914.1958, 215.6936),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 11",
            coords = vector3(-5.1532, -132.7874, 56.6125),
            radius = 100.0,
            description = "secret"
        },
        {
            name = "Location 12",
            coords = vector3(-639.6050, -838.8794, 24.8888),
            radius = 100.0,
            description = "secret"
        }                                                     
    }
}

Config.Notifications = {
    showReactionNotifications = false,  -- Show notifications for NPC reactions (accept, reject, attack, etc.)
    showZoneWarnings = false, -- Show warning when entering restricted zone
    showSuccess = true, -- View a successful sale
    showErrors = true, -- Show error messages
    showPoliceAlert = false -- Show alert when NPC calls the police
}

-- Chances of various NPC reactions (must add up to 100%)
Config.NPCReactions = { -- (Values are in %)
    accept = 93,
    reject = 1,
    attack = 2,
    pullWeapon = 2,
    runAway = 2
}

-- ============================================================================================
-- Prohibited zones (Green zone where selling is not allowed, passive, etc.)
-- ============================================================================================
Config.RestrictedZones = {
    {
        name = "Hospital Pillbox Hill",
        coords = vector3(298.6532, -584.6108, 43.2608),
        radius = 300.0,
        blip = false
    },
    {
        name = "PD Station - Atlee Street",
        coords = vector3(477.6340, -978.5500, 27.9842),
        radius = 300.0,
        blip = false
    },
    {
        name = "PD Station - Odtahovka",
        coords = vector3(392.6748, -1625.5464, 29.2919),
        radius = 300.0,
        blip = false
    }, 
    {
        name = "Airport",
        coords = vector3(-1034.2822, -2731.1794, 20.0193),
        radius = 600.0,
        blip = false
    }, 
    {
        name = "Sheriff Station - Sandy / EMS Station",
        coords = vector3(1810.3079, 3667.2002, 34.2466),
        radius = 300.0,
        blip = false
    }, 
    {
        name = "EMS - Station",
        coords = vector3(-233.2220, 6317.8340, 31.4934),
        radius = 300.0,
        blip = false
    },  
    {
        name = "PD Stanice - Station",
        coords = vector3(-465.1984, 6012.9927, 31.3406),
        radius = 300.0,
        blip = false
    },
    {
        name = "Prison",
        coords = vector3(1681.4333, 2551.6968, 45.5648),
        radius = 800.0,
        blip = false
    }                        
}

Config.RestrictedZoneBlip = {
    sprite = 9,
    color = 1,
    scale = 0.8,
    alpha = 128
}

-- ============================================================================================
-- Drugs items for selling (just place ur item from script making a drugs)
-- ============================================================================================
Config.Drugs = {
    {
        item = "cocaine_baggy",
        label = "Cocaine Baggy",
        description = "Pure and strong white powder.",
        icon = "fa-solid fa-capsules",
        price = {min = 350, max = 900},
        requiredLevel = 0,
        fraction = "all",
        minAmount = 1,
        maxAmount = 3,
    },    
    {
        item = "meth_baggy",
        label = "Meth Baggy",
        description = "Strong and earthy OG Kush.",
        icon = "fas fa-joint",
        price = {min = 150, max = 450},
        requiredLevel = 0,
        fraction = "all",
        minAmount = 1,
        maxAmount = 3,
    },
    {
        item = "baggy_weed",
        label = "Weed Baggy",
        description = "A fragrant and euphoric experience.",
        icon = "fas fa-joint",
        price = {min = 150, max = 450},
        requiredLevel = 0,
        fraction = "all",
        minAmount = 1,
        maxAmount = 3,
    }    
}

-- ============================================================================================
-- Others
-- ============================================================================================
Config.BlacklistedPeds = { 
    `s_f_y_cop_01`, `csb_cop`, `s_m_m_snowcop_01`, `s_m_y_cop_01`, `s_m_y_hwaycop_01`, `ig_karen_daniels`, 
    `u_m_m_fibarchitect`, `u_m_m_prolsec_01`, `cs_casey`, `cs_prolsec_02`, `csb_mweather`, `csb_prolsec`, 
    `csb_ramp_marine`, `csb_trafficwarden`, `mp_m_avongoon`, `mp_m_fibsec_01`, `mp_m_securoguard_01`, 
    `mp_s_m_armoured_01`, `s_f_y_ranger_01`, `s_f_y_sheriff_01`, `s_f_y_scrubs_01`, `s_f_y_casino_01`, 
    `s_m_m_armoured_01`, `s_m_m_armoured_02`, `s_m_m_chemsec_01`, `s_m_m_ciasec_01`, `s_m_m_doctor_01`, 
    `s_m_m_fiboffice_01`, `s_m_m_fiboffice_02`, `s_m_m_fibsec_01`, `s_m_m_marine_01`, `s_m_m_marine_02`, 
    `s_m_m_prisguard_01`, `s_m_m_scientist_01`, `s_m_m_security_01`, `s_m_y_armymech_01`, `s_m_y_blackops_01`, 
    `s_m_y_blackops_02`, `s_m_y_blackops_03`, `s_m_y_marine_01`, `s_m_y_marine_02`, `s_m_y_marine_03`, 
    `s_m_y_pilot_01`, `s_m_y_ranger_01`, `s_m_y_sheriff_01`, `s_m_y_swat_01`, `ig_casey`, `ig_prolsec_02`, 
    `u_m_y_juggernaut_01`, `s_m_y_construct_01`, `s_m_y_construct_0`, `a_m_m_hasjew_01`, `a_m_m_farmer_01`, 
    `a_m_m_eastsa_02`, `a_m_m_hillbilly_02`, `a_m_m_hasjew_01` 
}

Config.NPCWeapons = {
    `WEAPON_PISTOL`,
    `WEAPON_PISTOL50`,
    `WEAPON_SNSPISTOL`
}

Config.SellAnimation = {
    dict = "mp_common",
    anim = "givetake1_a",
    duration = 3000
}

Config.NPCMeleeAttack = {
    combatRange = 2.0,      -- Attack distance
    fleeChance = 30,        -- Chance of NPC running away after attack (%)
    attackDuration = 10000  -- How long does the NPC attack (ms)
}

Config.NPCFlee = {
    duration = 15000,       -- How long does the NPC run (ms)
    sprintSpeed = 1.5       -- Running speed
}

Config.NPCFreeze = {
    useTaskScenario = true,     -- Use scenario instead of TaskStandStill
    scenario = "WORLD_HUMAN_STAND_IMPATIENT"
}

Config.NPCPhoneCall = {
    animDict = "cellphone@",  
    animName = "cellphone_call_listen_base",
    phoneModel = `prop_npc_phone_02`,
    callDurationMin = 30000,
    callDurationMax = 30000
}

-- Dialogs NPC (Native speechs)
Config.NPCSpeech = {
    accept = {
        "GENERIC_THANKS",
        "CHAT_STATE",
        "GENERIC_YES"
    },
    reject = {
        "NO_RESPONSE",
        "GENERIC_INSULT_HIGH",
        "GENERIC_FUCK_YOU",
        "GENERIC_NO"
    },
    attack = {
        "GENERIC_INSULT_HIGH",
        "GENERIC_CURSE_HIGH",
        "GENERIC_FUCK_YOU",
        "FIGHT"
    },
    pullWeapon = {
        "GENERIC_WAR_CRY",
        "INTIMIDATE_RESP",
        "GUN_AIM"
    },
    runAway = {
        "GENERIC_FRIGHTENED_HIGH",
        "PANIC",
        "SCREAM_SCARED"
    },
    restrictedZone = {
        "GENERIC_SHOCKED_HIGH",
        "PHONE_CALL_EMERGENCY",
        "GENERIC_FUCK_YOU"
    },
    alreadySold = {
        "NO_RESPONSE",
        "GENERIC_NO",
        "GENERIC_BYE"
    }
}

Config.ProgressBar = {
    label = "Selling drugs...",
    duration = 3000,
    position = 'bottom',
    useWhileDead = false,
    canCancel = true,
    disable = {
        car = true,
        move = true,
        combat = true
    }
}