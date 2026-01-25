Config = {}

-- ============================================================================================
-- Global Settings - You can modify these
-- ============================================================================================
Config.Locale = 'en' -- 'en' or 'cs'
Config.Framework = 'ESX' -- 'ESX' or 'QB'
Config.Inventory = 'ox_inventory' -- Available options: 'ox_inventory' (recommended), 'qb-inventory' - QBCore default inventory
Config.ProgressBar = 'ox_lib' -- Available options: 'ox_lib' (recommended), 'qb-progressbar' - QBCore progress bar
Config.Target = 'ox_target' -- Available options: 'ox_target' (recommended), 'qb-target' - QBCore target system
Config.DefaultCurrency = 'black_money' -- Available options: 'money' (default cash) or 'black_money' (dirty money)
Config.InventoryImagePath = 'nui://ox_inventory/web/images/' -- For ox_inventory: 'nui://ox_inventory/web/images/' - For qb-inventory: 'nui://qb-inventory/html/images/'

-- ====================================
-- NOTIFICATION SYSTEM
-- ====================================
Config.SendClientNotification = function(data)
    -- Default: ox_lib
    --lib.notify(data)

    -- fsNotify (requires: title, message, time, type, playSound) -- Just uncomment it and comment lib.notify(data)
    --exports['fs_notify']:SendNotification({title = data.title, description = data.description, duration = data.duration or 5000, type = data.type or 'info', position = 'top-right'})

    -- okokNotify (requires: title, message, time, type, playSound) -- Just uncomment it and comment lib.notify(data)
    --exports['okokNotify']:Alert(data.title or '', data.description, data.duration or 5000, data.type or 'info', playSound)

    -- Example for ESX:
    exports["esx_notify"]:Notify(data.type or 'info', data.duration or 5000, data.description, data.title)

    -- Example for QBCore:
    -- QBCore.Functions.Notify(data.description, data.type or 'primary', data.duration or 5000)
end

Config.Notifications = {
    npc_nervous = { enabled = true, title = 'Warning', type = 'error', duration = 2500 },
    npc_runs_away = { enabled = true, title = 'Scammed', type = 'error', duration = 2500 },
    npc_attacks = { enabled = true, title = 'Danger', type = 'error', duration = 2500 },
    npc_shoots = { enabled = true, title = 'Danger', type = 'error', duration = 2500 },
    npc_talks = { enabled = true, title = 'Dealer', type = 'info', duration = 2500 },

    dealer_spawned = { enabled = true, title = 'Dealer Arrived', type = 'info', duration = 2500 },
    dealer_despawned = { enabled = false, title = 'Dealer Left', type = 'info', duration = 5000 },
    dealer_left = { enabled = false, title = 'Dealer Left', type = 'error', duration = 3000 },

    purchase_successful = { enabled = true, title = 'Success', type = 'success', duration = 2500 },
    purchase_failed = { enabled = true, title = 'No money', type = 'error', duration = 2500 },
    insufficient_funds = { enabled = true, title = 'No money', type = 'error', duration = 2500 },
    insufficient_black_money = { enabled = true, title = 'No money', type = 'error', duration = 2500 },

    dealer_scam = { enabled = true, title = 'Scammed', type = 'error', duration = 2500 },
    dealer_robbery = { enabled = true, title = 'Robbed', type = 'error', duration = 2500 },
    dealer_attack = { enabled = true, title = 'Attacked', type = 'error', duration = 2500 },

    dealer_handing_items = { enabled = true, title = 'Dealer', type = 'info', duration = 2500 },
    player_handing_money = { enabled = true, title = 'You', type = 'info', duration = 2500 },
    transaction_complete = { enabled = true, title = 'Trade Successful', type = 'success', duration = 3000 },
}

-- ============================================================================================
-- Other settings - I dont recomment to change it, if you dont know correctly what to do
-- ============================================================================================
Config.Tablet = {
    progressDuration = 1500,
    progressLabel = 'Opening Blackmarket Tablet',
    animDict = 'amb@code_human_in_bus_passenger_idles@female@tablet@base',
    animName = 'base',
    propModel = 'prop_cs_tablet',
    propBone = 60309,
    propPosition = vector3(0.03, 0.002, -0.0),
    propRotation = vector3(10.0, 160.0, 0.0)
}

-- ============================================================================================
-- Blackmarket Settings - You can modify these
-- ============================================================================================
Config.UI = { currencyIcon = 'fa-solid fa-dollar-sign', }
Config.TargetSettings = { collectOrder = { name = 'Collect order', icon = 'fas fa-box' } }
Config.BlipSettings = { sprite = 500, scale = 0.8, color = 1, shortRange = true, name = "The dealer is coming right here" }

Config.NPCModel = 's_m_y_dealer_01'
Config.NPCRespawnTime = 1 * 60 * 1000
Config.NPCInteractionDistance = 2.00
Config.NPCExitDistance = 10.0 -- Distance when player triggers NPCs to exit vehicle

Config.SpawnVehicle = true
Config.VehicleModel = 'burrito3'

Config.SpawnBodyguards = true
Config.BodyguardModel = 's_m_y_blackops_01'
Config.BodyguardWeapon = 'WEAPON_PISTOL'
Config.BodyguardProtection = true

Config.DealerScenario = "WORLD_HUMAN_SMOKING_POT"
Config.BodyguardScenario = "WORLD_HUMAN_GUARD_STAND"
Config.BodyguardArmor = 100
Config.BodyguardMaxHealth = 300
Config.BodyguardHealth = 300
Config.RunAwayTimeout = 10000 -- Time before NPC despawns after running away (in milliseconds)
Config.AttackTimeout = 30000 -- Time before NPC despawns after attacking (in milliseconds)
Config.ShootTimeout = 45000 -- Time before NPC despawns after shooting (in milliseconds)
Config.NPCWeapon = 'WEAPON_PISTOL' -- Weapon given to dealer when shooting
Config.NPCWeaponAmmo = 250 -- Ammo amount for dealer weapon

Config.ReactionChances = {
    Talk = 100,
    Run = 0,
    Attack = 0,
    Shoot = 0
}

Config.SpawnLocations = {
    {
        area = 'industrial',
        vehicle = vector4(747.0483, -1337.6389, 26.0502, 125.6822),
        dealer = vector4(748.0753, -1338.6066, 26.2295, 213.1660),
        bodyguards = {
            vector4(747.3387, -1340.1074, 26.2260, 251.9195),
            vector4(749.9108, -1337.9143, 26.2309, 182.7041),
            -- Add more bodyguards here as needed
        }
    }
}

Config.Items = {
    { name = 'WEAPON_PISTOL', label = 'Pistol', price = 5000, type = 'item'},
    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', price = 7500, type = 'item'},
    { name = 'WEAPON_SMG', label = 'SMG', price = 15000, type = 'item'},
    { name = 'ammo-9', label = '9mm Ammo (50x)', price = 500, type = 'item', amount = 50},
    { name = 'ammo-45', label = '.45 ACP Ammo (50x)', price = 600, type = 'item', amount = 50},
    { name = 'lockpick', label = 'Lockpick', price = 250, type = 'item', amount = 1},
    { name = 'baggy_weed', label = 'Weed (10g)', price = 150, type = 'item', amount = 10},
}
