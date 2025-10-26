Config = {}

-------- Test

-- Základní nastavení
Config.Debug = false
Config.Language = 'cs'
Config.Framework = 'ESX' -- nebo 'QB'

-- Pozice
Config.Locations = {
    {
        name = "Místo 1",
        coords = vector3(100.0, 200.0, 30.0),
        radius = 50.0,
        blip = {
            sprite = 1,
            color = 2,
            scale = 0.8,
            label = "Důležité místo"
        }
    },
    {
        name = "Místo 2",
        coords = vector3(150.0, 250.0, 35.0),
        radius = 75.0,
        blip = {
            sprite = 2,
            color = 3,
            scale = 1.0,
            label = "Další místo"
        }
    }
}

-- UI Nastavení
Config.UI = {
    position = "top-right", -- top-left, top-right, bottom-left, bottom-right
    theme = "dark", -- dark, light
    animations = true,
    sound = true,
    soundVolume = 0.5
}

-- Notifikace
Config.Notifications = {
    duration = 5000, -- ms
    position = "top-right",
    types = {
        success = {
            color = "#10b981",
            icon = "fa-check-circle"
        },
        error = {
            color = "#ef4444",
            icon = "fa-times-circle"
        },
        info = {
            color = "#3b82f6",
            icon = "fa-info-circle"
        },
        warning = {
            color = "#f59e0b",
            icon = "fa-exclamation-triangle"
        }
    }
}

-- Oprávnění
Config.Permissions = {
    admin = {
        groups = {'admin', 'superadmin'},
        commands = {'reset', 'reload', 'config'}
    },
    moderator = {
        groups = {'mod', 'moderator'},
        commands = {'kick', 'warn'}
    },
    vip = {
        groups = {'vip', 'premium'},
        commands = {'special'}
    }
}

-- Ekonomika
Config.Economy = {
    currency = 'Kč',
    priceMultiplier = 1.0,
    prices = {
        item1 = 100,
        item2 = 250,
        item3 = 500,
        item4 = 1000
    }
}

-- Webhook (Discord)
Config.Webhook = {
    enabled = true,
    url = 'https://discord.com/api/webhooks/your_webhook_here',
    username = 'Server Logger',
    avatar = 'https://i.imgur.com/your_avatar.png',
    color = 3447003, -- Modrá
    footer = {
        text = 'FiveM Server',
        icon_url = 'https://i.imgur.com/your_icon.png'
    }
}

-- Zprávy
Config.Messages = {
    cs = {
        welcome = 'Vítejte na serveru!',
        goodbye = 'Nashledanou!',
        error = 'Došlo k chybě!',
        success = 'Akce byla úspěšná!',
        no_permission = 'Nemáte oprávnění!',
        invalid_input = 'Neplatný vstup!'
    },
    en = {
        welcome = 'Welcome to the server!',
        goodbye = 'Goodbye!',
        error = 'An error occurred!',
        success = 'Action was successful!',
        no_permission = 'You do not have permission!',
        invalid_input = 'Invalid input!'
    }
}

-- Funkce pro získání zprávy
function GetMessage(key)
    local lang = Config.Language
    if Config.Messages[lang] and Config.Messages[lang][key] then
        return Config.Messages[lang][key]
    end
    return 'Message not found: ' .. key
end

-- Funkce pro logování
function LogToConsole(message, level)
    level = level or 'INFO'
    if Config.Debug then
        print(string.format('[%s] %s', level, message))
    end
end

-- Export pro ostatní scripty
exports('GetConfig', function()
    return Config
end)

exports('GetMessage', GetMessage)
exports('Log', LogToConsole)
