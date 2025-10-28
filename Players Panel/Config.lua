Config = {}

-- ============================================================================================
-- Global Settings
-- ============================================================================================
Config.Locale = 'en' -- 'en' or 'cs'
Config.Framework = 'auto' -- 'auto', 'esx', 'qb-core', 'standalone'
Config.ToggleKey = 214 -- DELETE key
Config.AnimationSpeed = 350 -- ms
Config.MaxPlayersDisplay = 100

-- ============================================================================================
-- Prop system when passing
-- ============================================================================================
Config.Categories = {
    {
        name = 'state_departments',
        label = 'State Departments',
        icon = 'building-shield',
        departments = {'police', 'lssd', 'ambulance'}
    },
    {
        name = 'others',
        label = 'Others',
        icon = 'briefcase',
        departments = {'mechanic'}
    }
}

Config.JobMapping = {
    ['qb-core'] = {
        ['police'] = 'police',
        ['lspd'] = 'police', 
        ['bcso'] = 'lssd',
        ['sheriff'] = 'lssd',
        ['lssd'] = 'lssd',
        ['ambulance'] = 'ambulance',
        ['ems'] = 'ambulance',
        ['mechanic'] = 'mechanic',
        ['cardealer'] = 'mechanic'
    }
}

Config.Departments = {
    ['police'] = {
        label = 'LSPD',
        color = '#3a6ea5',
        icon = 'shield',
        grades = {0, 1, 2, 3, 4} -- Grade IDs
    },
    ['lssd'] = {
        label = 'LSSD',
        color = '#3a45a5ff',
        icon = 'shield-halved',
        grades = {0, 1, 2, 3, 4} -- Grade IDs
    },    
    ['ambulance'] = {
        label = 'EMS',
        color = '#e74c3c',
        icon = 'heart',
        grades = {0, 1, 2, 3, 4}
    },
    ['mechanic'] = {
        label = 'Mechanic',
        color = '#f39c12',
        icon = 'wrench',
        grades = {0, 1, 2, 3}
    }
}

-- ============================================================================================
-- Job names mapping for different frameworks
-- ============================================================================================
Config.UI = {
    logoUrl = 'images/logo.png', -- Path to your logo image
    overlayOpacity = 0.4 -- Black overlay opacity (0-1)
}