Config = {}

-- Notification Settings
Config.DefaultPosition = 'top-right' -- Options: 'top-right', 'top-middle', 'top-left'
Config.DefaultDuration = 6500
Config.MaxNotifications = 5
Config.AnimationSpeed = 500
Config.Spacing = 1.5
Config.EnableSound = true
Config.ShowBottomProgress = true
Config.ShowIconProgress = true 

-- Icon Settings (FontAwesome)
Config.Icons = {
    success = 'fa-check',
    error = 'fa-times',
    warning = 'fa-triangle-exclamation',
    info = 'fa-info',
    inform = 'fa-bullhorn'
}

Config.Colors = {
    success = {
        background = '#10b981',
        icon = '#059669'
    },
    error = {
        background = '#ef4444',
        icon = '#dc2626'
    },
    warning = {
        background = '#f59e0b',
        icon = '#d97706'
    },
    info = {
        background = '#3b82f6',
        icon = '#2563eb'
    },
    inform = {
        background = '#8b5cf6',
        icon = '#7c3aed'
    }
}
