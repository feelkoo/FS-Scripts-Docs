Config = {}

-- ============================================================================================
-- BASIC SETTINGS - Do not modify this.
-- ============================================================================================
Config.TabletItem = 'delivery_tablet'
Config.MaxConcurrentMissions = 1

-- ============================================================================================
-- FONTAWESOME ICONS - You can modify these / ox_target icons (interactions)
-- ============================================================================================
Config.Icons = {
    pickupShopItems = 'fas fa-box',
    pickupVehicleInfo = 'fas fa-clipboard',
    deliverVehicle = 'fas fa-handshake',
}

-- ============================================================================================
-- NOTIFICATION SYSTEM - You can modify this function to match your notification system
-- ============================================================================================
Config.Notification = {
    -- Custom notification function - MODIFY THIS to match your notification system
    -- Parameters: title (string), message (string), type (string), duration (number)
    -- Types: 'success', 'error', 'inform', 'warning'
    Show = function(title, message, notifType, duration)
        -- OX Lib notification (default)
        lib.notify({
            title = title,
            description = message,
            duration = duration or 5000,
           type = notifType or 'inform'
        })

        -- Just uncomment okokNotify export and comment lib.notify:
        -- exports['okokNotify']:Alert(title, message, duration, notifType, playSound)

        --[[
            -- ESX Default:
            ESX.ShowNotification(message)

            -- Custom notify:
            TriggerEvent('your_notify:show', {
                title = title,
                message = message,
                type = notifType,
                duration = duration
            })
        ]]--
    end
}

-- ============================================================================================
-- PROGRESS BAR SYSTEM - You can modify this function to match your progress bar system
-- ============================================================================================
Config.ProgressBar = {
    -- Custom progress bar function - MODIFY THIS to match your progress bar system
    -- Parameters: duration (number in ms), label (string), options (table)
    -- Returns: boolean (true if completed, false if cancelled)
    Show = function(duration, label, options)
        -- OX Lib progress bar (default)
        return lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = options.useWhileDead or false,
            canCancel = options.canCancel or false,
            disable = options.disable or {
                car = true,
                move = true,
                combat = true
            },
            anim = options.anim or {
                dict = 'mp_common',
                clip = 'givetake1_a'
            }
        })

        --[[
            EXAMPLES FOR OTHER PROGRESS BAR SYSTEMS:

            -- ESX ProgressBar:
            ESX.Progressbar(label, duration, {
                FreezePlayer = true,
                animation = {
                    type = "anim",
                    dict = options.anim and options.anim.dict or "mp_common",
                    lib = options.anim and options.anim.clip or "givetake1_a"
                },
                onFinish = function()
                end
            })
            return true
        ]]
        --
    end
}

-- ============================================================================================
-- DISPATCH SYSTEM SETTINGS - You can modify this function to match your dispatch system
-- ============================================================================================
Config.Dispatch = {
    enabled = true, -- Enable/disable dispatch alerts for high-tier vehicles
    
    TriggerAlert = function()
        local data = exports['cd_dispatch']:GetPlayerInfo()

        if data then
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = {'police'},
                coords = data.coords,
                title = Locale.dispatchTitle,
                message = string.format(Locale.dispatchMessage, data.street),
                flash = 0,
                unique_id = data.unique_id,
                sound = 1,
                blip = {
                    sprite = 431,
                    scale = 1.2,
                    colour = 1,
                    flashes = false,
                    text = Locale.dispatchBlipText,
                    time = 5,
                    radius = 0,
                }
            })
        end

        --[[
            EXAMPLES FOR OTHER DISPATCH SYSTEMS:

            -- PS-Dispatch example:
            exports['ps-dispatch']:VehicleTheft()

            -- Core Dispatch example:
            local coords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('core_dispatch:addCall', '10-16', 'Vehicle Theft', {{icon = 'fas fa-car', info = 'High-tier vehicle'}}, {coords[1], coords[2], coords[3]}, 'police', 5000, 11, 5)
        ]]--
    end
}

-- ============================================================================================
-- CONFIGURABLE GAME PARAMETERS - You can modify these
-- ============================================================================================
Config.GameSettings = {
    higherTierRequired = 5, -- Number of deliveries required to refresh a job of the current tier.
    missionExpirationMinutes = 20, -- Time until a job automatically fails (AFK, etc.)
    npcInteractionDistance = 1.8, -- Distance from NPC to interact (1.5m, measured in meters)
    vehicleDeliveryDistance = 5.0, -- Distance between the delivery vehicle and NPC to complete the delivery.
    xpPerDelivery = 70, -- XP gained for completing a delivery
    xpPerLevel = 250, -- XP required to reach the next level (multiplied by level)
    maxTeamMembers = 4, -- Maximum number of players per delivery mission (Keep it at 4)
    bodyguardHealth = 200, -- Bodyguard health (200/200 = 100% HP)
    bodyguardArmor = 100, -- Armor value for bodyguards
    bodyguardDetectionDistance = 78.0, -- Distance at which bodyguards are triggered near a player
    bodyguardAccuracy = 85, -- Accuracy of bodyguards (0–100)
    bodyguardCombatAbility = 2, -- Combat ability (0=Poor, 1=Average, 2=Professional)
    bodyguardCombatMovement = 2, -- Combat movement (0=Stationary, 1=Defensive, 2=Offensive)
    bodyguardCombatRange = 2, -- Combat range (0=Near, 1=Medium, 2=Far)
    bodyguardAlertness = 3, -- Alertness level (0–3, higher = more alert)
}

-- ============================================================================================
-- POLICE REQUIREMENT SETTINGS - You can modify these
-- ============================================================================================
Config.PoliceSettings = {
    enabled = true, -- Enable/disable police requirement check for high-tier missions
    requiredForClasses = {'A', 'S', 'S+', 'X'}, -- Which tiers require police to be online
    minimumPoliceCount = 1, -- Minimum number of police officers online
    policeJobs = {'police', 'sahp'}, -- Police job names (ESX job names)
}

-- ============================================================================================
-- WIRE CONNECTING MINIGAME SETTINGS - You can modify these
-- ============================================================================================
Config.WiringMinigame = {
    difficulty = {
        ['F'] = {
            wires = {'A'},
            description = Locale.diffBasic
        },
        ['D'] = {
            wires = {'A', 'B'},
            description = Locale.diffEasy
        },
        ['C'] = {
            wires = {'A', 'B', 'C'},
            description = Locale.diffMedium
        },
        ['B'] = {
            wires = {'A', 'B', 'C', 'D'},
            description = Locale.diffAdvanced
        },
        ['A'] = {
            wires = {'A', 'B', 'C', 'D', 'E'},
            description = Locale.diffHard
        },
        ['S'] = {
            wires = {'A', 'B', 'C', 'D', 'E', 'F'},
            description = Locale.diffExpert
        },
        ['S+'] = {
            wires = {'A', 'B', 'C', 'D', 'E', 'F'},
            description = Locale.diffMaster
        },
        ['X'] = {
            wires = {'A', 'B', 'C', 'D', 'E', 'F'},
            description = Locale.diffUltimate
        }
    },
    
    wireColors = {
        ['A'] = '#ff4757',
        ['B'] = '#2ed573',
        ['C'] = '#1e90ff',
        ['D'] = '#ffa502',
        ['E'] = '#a55eea',
        ['F'] = '#ffdd59'
    },
    
    settings = {
        shuffleRightSide = true,
        enableSounds = true,
        showProgress = true,
        allowRetry = true
    }
}

-- ============================================================================================
-- GPS TRACKING MINIGAME HACKING SETTINGS - You can modify these
-- ============================================================================================
Config.HackingSequences = {
    timers = { -- Its in seconds
        ['A'] = 20, 
        ['S'] = 40,
        ['S+'] = 40,
        ['X'] = 50 
    },
    requiredSequences = { -- Sequences (Its like a level)
        ['A'] = 5,
        ['S'] = 12,
        ['S+'] = 20,
        ['X'] = 30 
    },
    codePatterns = { -- Code pattern in GPS tracker minigame
        'A7F2', 'B9E1', 'C4D8', 'E3A6', 'F1B9', 'G8C2', 'H5D7', 'J2E4',
        '91X3', '84Y7', '76Z2', '53W9', '29Q8', '47R5', '38T6', '65U4',
        'Alpha', 'Beta', 'Gamma', 'Delta', 'Echo', 'Foxtrot', 'Golf', 'Hotel'
    },

    gridSettings = {
        baseGridUpdateInterval = 1000, -- Basic interval 1 second
        baseShowChance = 0.8, -- 80% chance of displaying a green box
        baseGreenCellDuration = 1200, -- 1.2 seconds base

        speedUpSettings = {
            enabled = true, -- Enable acceleration
            intervalDecrease = 35, -- Slight acceleration
            minInterval = 350, -- Slower minimum
            chanceIncrease = 0.08, -- Smaller chance increase (8%)
            maxChance = 0.92, -- Not 100% chance, max 92%
            durationDecrease = 60, -- Slightly fading fields
            minDuration = 600 -- Longer minimum display
        },

        antiSpamSettings = {
            enabled = true, 
            enterCooldown = 500 
        }
    }
}

-- ============================================================================================
-- VEHICLE DAMAGE SYSTEM SETTINGS - You can modify these
-- ============================================================================================
Config.DamageSettings = {
    bodyDamageMaxDeduction = 2000, -- Maximum deductible for body damage ($)
    tyreDamageDeduction = 400, -- Deductible for each flat tire ($)
    doorDamageDeduction = 350, -- Deductible for damaged doors (hood, trunk, etc.) ($)
    lightDamageDeduction = 250, -- Deductible for broken lights ($)
    deformationDamageDeduction = 500, -- Deductible for physical dents ($)
    maxTotalDeduction = 15000, -- Maximum total deductible for all damages ($)
    enableDamageNotifications = true, -- Show notifications about damage
    
    -- Thresholds for damage detection
    damageThresholds = {
        bodyHealthThreshold = 950, -- Below 90% body health = damage
        deformationThreshold = 0.12, -- Minimum deformation for dent detection
        minDamageForPenalty = 50 -- Minimum damage for collision ($)
    }
}

-- ============================================================================================
-- NPC SETTINGS AND ANIMATIONS AND MODELS - You can modify theese if you understand, what to do
-- ============================================================================================
Config.NPCSettings = {
    pickup = {
        npcModel = 'a_m_m_eastsa_02',
        animDict = 'amb@world_human_smoking@male@male_a@base',
        animName = 'base',
        animSpeed = 8.0,
        animBlendIn = -8.0,
        animDuration = -1,
        animFlag = 1,
        propModel = 'prop_cs_ciggy_01',
        propBone = 28422,
        propOffset = {x = 0.01, y = -0.02, z = 0.01},
        propRotation = {x = 0.0, y = 0.0, z = 0.0},
        positionCheck = {
            enabled = true,
            checkInterval = 5000,
            maxDistance = 10.0
        }
    },

    delivery = {
        npcModel = 'mp_m_waremech_01',
        npcModels = {
            ['F'] = 'mp_m_waremech_01',
            ['D'] = 'mp_m_waremech_01',
            ['C'] = 'mp_m_waremech_01',
            ['B'] = 'mp_m_waremech_01',
            ['A'] = 'mp_m_waremech_01',
            ['S'] = 'cs_paper',
            ['S+'] = 'cs_paper',
            ['X'] = 'cs_paper'
        },
        animDict = 'amb@world_human_smoking@male@male_a@base',
        animName = 'base',
        animSpeed = 8.0,
        animBlendIn = -8.0,
        animDuration = -1,
        animFlag = 1,
        propModel = 'prop_cs_ciggy_01',
        propBone = 28422,
        propOffset = {x = 0.01, y = -0.02, z = 0.01},
        propRotation = {x = 0.0, y = 0.0, z = 0.0},
        positionCheck = {
            enabled = true,
            checkInterval = 5000,
            maxDistance = 10.0
        }
    }
}

Config.Models = {
    tablet = {
        model = 'prop_cs_tablet',
        bone = 28422,
        offset = {x = 0.0, y = 0.0, z = 0.03},
        rotation = {x = 0.0, y = 0.0, z = 0.0},
        animDict = 'amb@code_human_in_bus_passenger_idles@female@tablet@base',
        animName = 'base',
        animSpeed = 3.0,
        animFlag = 49
    }
}

-- ============================================================================================
-- LOCATIONS AND COORDINATES - NPCs - You can modify these
-- ============================================================================================
-- Delivery location
Config.DeliveryPoints = {
    {x = 1967.6520, y = 3767.4688, z = 32.1932, heading = 75.4687}, -- Sandy Shores
    {x = 2781.5234, y = -706.1702, z = 5.0186, heading = 125.9042}, -- Postal 566
    {x = 1907.9056, y = 575.1411, z = 175.8218, heading = 234.9022}, -- Postal 551
    {x = 1260.6707, y = 1925.0679, z = 78.5040, heading = 254.0144}, -- Postal 541
    {x = 3815.5369, y = 4477.2090, z = 3.6586, heading = 158.2124}, -- Postal 086
    {x = 1370.4821, y = 6544.6304, z = 15.6265, heading = 338.1700}, -- Postal 068
    {x = -136.4398, y = 6494.9668, z = 29.7057, heading = 105.4250}, -- Postal 024
    {x = 397.4555, y = 3564.5312, z = 33.2922, heading = 336.7798}, -- Postal 234
    {x = -39.4145, y = 1883.3300, z = 195.6411, heading = 154.4185}, -- Postal 518
    {x = -3255.5217, y = 995.8307, z = 12.4657, heading = 225.7031}, -- Postal 433/4
    {x = -3047.9465, y = 174.0450, z = 11.6080, heading = 162.6945}, -- Postal 439 
    {x = -1701.1650, y = -945.4095, z = 7.6764, heading = 322.1320}, -- Postal 686
    {x = -1626.7808, y = -798.9307, z = 10.1931, heading = 181.0311}, -- Postal 686
    {x = -1822.5820, y = 804.6991, z = 138.6931, heading = 312.6781}, -- Postal 430
    {x = -2576.8186, y = 2331.1421, z = 33.0600, heading = 243.4190}, -- Postal 418
    {x = -1129.4979, y = 2694.7622, z = 18.8004, heading = 114.3712}, -- Postal 403
    {x = 59.0184, y = 2795.2444, z = 57.8782, heading = 292.7224}, -- Postal 226
    {x = 163.1085, y = 2289.2178, z = 94.1476, heading = 241.1703}, -- Postal 375
    {x = 564.9874, y = 2594.8347, z = 43.0009, heading = 98.6203}, -- Postal 242
    {x = 2542.2769, y = 349.9435, z = 108.6095, heading = 216.9121 }, -- Postal 557
}

-- Pickup location
Config.PickupPoints = {
    {x = -1416.8727, y = -279.8744, z = 46.3089, heading = 179.1710, npcModel = 'a_m_m_business_01'},
    {x = -273.3617, y = 177.0637, z = 79.6503, heading = 305.4542, npcModel = 'a_m_m_business_01'},
    {x = -528.1871, y = -879.7275, z = 25.2382, heading = 225.3591, npcModel = 'a_m_m_business_01'}, -- Postal 732
    {x = -761.7492, y = 354.2497, z = 87.8556, heading = 357.3863, npcModel = 'a_m_m_business_01'}, -- Postal 472
    {x = 38.6443, y = -100.4945, z = 56.0700, heading = 341.0711, npcModel = 'a_m_m_business_01'}, -- Postal 607
    {x = 78.2848, y = 66.7811, z = 74.3783, heading = 26.9983, npcModel = 'a_m_m_business_01'}, -- Postal 606
    {x = -1374.7206, y = -639.9614, z = 28.6734, heading = 180.8049, npcModel = 'a_m_m_business_01'}, -- Postal 677
    {x = -175.8785, y = 216.2919, z = 89.0130, heading = 175.4768, npcModel = 'a_m_m_business_01'}, -- Postal 624
    {x = -456.7559, y = 289.2317, z = 83.2295, heading = 352.1657, npcModel = 'a_m_m_business_01'}, -- Postal 489
    {x = 318.7973, y = 268.0306, z = 104.5337, heading = 189.0717, npcModel = 'a_m_m_business_01'}, -- Postal 596
    {x = 35.3562, y = -1031.8971, z = 29.5072, heading = 119.1431, npcModel = 'a_m_m_business_01'}, -- Postal 745
    {x = -400.6766, y = -131.0065, z = 38.5323, heading = 302.4741, npcModel = 'a_m_m_business_01'}, -- Postal 633       
}

-- Shop delivery location
Config.ShopPickupLocation = {
    coords = vector3(596.2590, -456.2872, 23.7449),
    heading = 339.0,
    npcModel = 's_m_y_construct_01'
}

-- ============================================================================================
-- ORDER CLASSES - You can modify these
-- ============================================================================================
Config.RankRequirements = {
    ['F'] = 0,
    ['D'] = 20,
    ['C'] = 35,
    ['B'] = 50,
    ['A'] = 125,
    ['S'] = 350,
    ['S+'] = 500,
    ['X'] = 999
}

Config.VehicleClasses = {
    ['F'] = {
        label = 'Class F',
        minReward = 250,
        maxReward = 1000,
        ethReward = 0.010,
        vehicleCost = 5.0,
        vehicles = {
            {
                model = 'issi6', 
                maxPlayers = 2, 
                hint = 'Its a small yellow vehicle with pink wheels. Its located in a narrow alley around postcodes 825 to 823.', 
                spawnZones = {
                    {x = 537.5824, y = -1776.5782, z = 28.2804, radius = 0.2563, heading = 0.2563},
                }
            },                                         
        }
    },
    ['D'] = {
        label = 'Class D',
        minReward = 1000,
        maxReward = 2500,
        ethReward = 0.015,
        vehicleCost = 10.0,
        vehicles = {
            {
                model = 'savestra', 
                maxPlayers = 2, 
                hint = 'The vehicle is older, not the newest. It should be parked in the parking lot. You can find it in the area between postal codes 472 and 489.',
                spawnZones = {
                    {x = -562.7821, y = 311.9173, z = 83.7985, radius = 84.4004, heading = 84.4004}, 
                }
            },
            {
                model = 'rhapsody', 
                maxPlayers = 2, 
                hint = 'The vehicle is older, not the newest. It should be parked in the parking lot. You can find it in the area between postal codes 574 and 771.',
                spawnZones = {
                    {x = -822.0280, y = -757.2488, z = 21.7083, radius = 268.4997, heading = 268.4997}, 
                }
            },                                 
        }
    },
    ['C'] = {
        label = 'Class C',
        minReward = 2500,
        maxReward = 4000,
        ethReward = 0.030,
        vehicleCost = 15.0,
        vehicles = {
            {
                model = 'asbo', 
                maxPlayers = 2, 
                hint = 'It is a smaller vehicle for 2 people. It is located in the parking lot, around postal numbers 472 to 489.',
                spawnZones = {
                    {x = -612.3422, y = 331.3896, z = 84.5107, radius = 174.7272, heading = 174.7272},
                }
            },
            {
                model = 'dilettante', 
                maxPlayers = 4, 
                hint = 'Its a 4-seater vehicle, not much but its doable. Its located on the street, around postcodes 475 to 489.',
                spawnZones = {
                    {x = -637.8522, y = 410.4168, z = 100.6331, radius = 274.5415, heading = 274.5415},
                }
            },                                         
        }
    },
    ['B'] = {
        label = 'Class B',
        minReward = 4000,
        maxReward = 7500,
        ethReward = 0.050,
        vehicleCost = 25.0,
        vehicles = {
            {
                model = 'astron', 
                maxPlayers = 4, 
                hint = 'The vehicle is an SUV. It should be parked next to the building in the curve. Youll find it around postcodes 570 to 573.',
                spawnZones = {
                    {x = 1375.3047, y = -728.3762, z = 66.4451, radius = 93.9776, heading = 93.9776},
                }
            },
            {
                model = 'baller', 
                maxPlayers = 4, 
                hint = 'The vehicle is an SUV. It should be parked in front of the tank and next to the building on the sandy road. You can find it around postcodes 782 to 792.',
                spawnZones = {
                    {x = 1474.5093, y = -1880.9401, z = 71.6616, radius = 288.5270, heading = 288.5270},
                }
            },                                                       
        }
    },
    ['A'] = {
        label = 'Class A',
        minReward = 7500,
        maxReward = 12500,
        ethReward = 0.055,
        vehicleCost = 35.0,
        vehicles = {
            {
                model = 'akuma', 
                maxPlayers = 2, 
                hint = 'Its a motorbike. It should be parked next to the turquoise cranes in the harbor. Dont forget to grab the shotgun, youll need it. Its located between postcodes 936 and 939.',
                spawnZones = {
                    {x = 841.1803, y = -3046.0935, z = 5.2637, radius = 75.9236, heading = 75.9236},
                }
            },
            {
                model = 'carbonrs', 
                maxPlayers = 2, 
                hint = 'Its a motorbike. It should be parked in the trailer parking lot at the marina. Dont forget to grab your shotgun, youll need it. Its located between postcodes 936 and 939.',
                spawnZones = {
                    {x = 857.8462, y = -2972.6531, z = 5.4170, radius = 178.7778, heading = 178.7778},
                }
            },                                                                                                         
        },
        bodyguards = {
            count = 2,
            model = 'ig_chengsr',
            weapons = {'WEAPON_BAT'}
        }
    },    
    ['S'] = {
        label = 'Class S',
        minReward = 12500,
        maxReward = 18000,
        ethReward = 0.080,
        vehicleCost = 50.0,
        vehicles = {
            {
                model = 'stafford', 
                maxPlayers = 4, 
                hint = 'Its an older vintage in front of a luxury hotel, never judge a book by its cover. Just dont forget to bring your gun. The car is located at post office 658.',
                spawnZones = {
                    {x = -1224.7764, y = -178.3720, z = 38.6827, radius = 107.8846, heading = 107.8846},
                }
            },
            {
                model = 'broadway', 
                maxPlayers = 2, 
                hint = 'This super car. It is also guarded by super armed security and you can find it around postal codes 463 to 464, specifically in the parking lot.',
                spawnZones = {
                    {x = -1195.3942, y = 346.0482, z = 70.4629, radius = 107.0125, heading = 107.0125},
                }
            },                                                           
        },
        bodyguards = {
            count = 5,
            model = 's_m_y_westsec_01',
            weapons = {'WEAPON_PISTOL'}
        }
    },
    ['S+'] = {
        label = 'Class S+',
        minReward = 18000,
        maxReward = 35000,
        ethReward = 0.1,
        vehicleCost = 75.0,
        vehicles = {
            {
                model = 'emerus', 
                maxPlayers = 2, 
                hint = 'You can find this stinger, along with the local security guard, in a secluded parking lot at the Maze Bank arena between posts 859 and 863.',
                spawnZones = {
                    {x = -44.1633, y = -2019.0339, z = 17.3096, radius = 58.3074, heading = 58.3074},
                }
            },
            {
                model = 'corsita', 
                maxPlayers = 2, 
                hint = 'You can find this demon, along with a dangerous security guard, under the highway in the parking lot between posts 872 and 909.',
                spawnZones = {
                    {x = -584.6331, y = -2119.5803, z = 5.3443, radius = 1.5584, heading = 1.5584},
                }
            },                                                                      
        },
        bodyguards = {
            count = 6,
            model = 'u_m_m_jewelsec_01',
            weapons = {'WEAPON_MACHINEPISTOL', 'WEAPON_SMG'}
        }
    },
    ['X'] = {
        label = 'Class X',
        minReward = 35000,
        maxReward = 50000,
        ethReward = 0.3,
        vehicleCost = 100.0,
        vehicles = {
            {
                model = 'prototipo', 
                maxPlayers = 2, 
                hint = 'You can find this cart in front of the observatory in the parking lot, watch out for the local commando!',
                spawnZones = {
                    {x = -417.2375, y = 1215.2269, z = 325.0688, radius = 232.9785, heading = 232.9785},
                }
            },
            {
                model = 's80', 
                maxPlayers = 1, 
                hint = 'You will find this sting in front of the observatory, be careful, this car is very guarded.',
                spawnZones = {
                    {x = -382.8011, y = 1213.2513, z = 324.8521, radius = 131.4598, heading = 131.4598},
                }
            },                                                           
        },
        bodyguards = {
            count = 8,
            model = 'csb_ramp_marine',
            weapons = {'WEAPON_SPECIALCARBINE', 'WEAPON_CARBINERIFLE'}
        }
    }    
}

-- ============================================================================================
-- SHOP PAPERS TIPS - You can modify these
-- ============================================================================================
Config.ShopPaperHints = {
    ['delivery_paper_train'] = 'Hello man! have you decided to embark on a Train Robbery? to start your train robbery you must first find me, and you will find me between post 266 and 277, dont forget your friends and Flexa!'
}

-- ============================================================================================
-- CONFIGURATION FOR STORE HELP - You can modify these
-- ============================================================================================
Config.ShopPaperConfig = {
    -- Heading for shop help (instead of "Vehicle Help")
    paperTitle = 'Help',
    
    -- Text for hint section (instead of "Help to find vehicle:")
    hintLabel = 'Help content:',
    
    -- 4 configurable boxes that will be displayed instead of the standard boxes
    customFields = {
        {
            label = 'Category:',
            value = 'General information'
        },
        {
            label = 'Help type:',
            value = 'Informational'  
        },
        {
            label = 'Difficulty:',
            value = 'Average'
        },
        {
            label = 'Importance:',
            value = 'Extreme'
        }
    }
}

-- ============================================================================================
-- ETHEREUM (Newly E-Coin) SHOP Settings - You can modify these
-- ============================================================================================
Config.EthereumShop = {
    enabled = true,
    startingBalance = 0.0,
    
    items = {
        {
            id = 'lockpick',
            name = 'Lockpick',
            price = 0.20,
            quantity = 1,
            oxInventoryItem = 'lockpick',
            image = 'lockpick.png'
        },
        {
            id = 'armour',
            name = 'Undershirt vest',
            price = 0.05,
            quantity = 1,
            oxInventoryItem = 'armour',
            image = 'armour.png'
        }                                                                                                                           
    },
    
    earnSettings = {
        speedBonus = {
            enabled = true,
            timeThreshold = 300,
            bonusMultiplier = 2 -- Bonus multiple E-Coin
        }
    }
}