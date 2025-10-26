# 📌 Název Scriptu
Krátký popis scriptu – k čemu je, co dělá a proč ho chceš používat.

## ✨ Funkce
- ✅ Funkce 1
- ✅ Funkce 2
- ✅ Exporty pro ostatní scripty
- ✅ Podpora ESX / QBCore (dle potřeby)

---

## 📦 Instalace
1. Vlož script do složky `resources/`
2. Přidej do `server.cfg`:
```cfg
ensure nazev-scriptu
```
3. Restartuj server

---

## 🔧 Exporty

### ✅ Server exports
```lua
-- Vrácení hodnoty z funkce
local hodnota = exports['nazev-scriptu']:GetValue()

-- Spuštění funkce
exports['nazev-scriptu']:DoSomethingServer("text")
```

### ✅ Client exports
```lua
-- Vrácení dat
local data = exports['nazev-scriptu']:GetClientData()

-- Spuštění animace
exports['nazev-scriptu']:PlayAnim("wave")
```

---

## 📌 Použití v jiných scriptech

### Server side
```lua
RegisterCommand("zkus", function(source)
    local data = exports['nazev-scriptu']:GetValue()
    print("Data:", data)
end)
```

### Client side
```lua
RegisterNetEvent("script:notify")
AddEventHandler("script:notify", function(msg)
    exports['nazev-scriptu']:ShowNotification(msg)
end)
```

---

## ⚙️ Konfigurační soubor

`config.lua`
```lua
Config = {}

Config.EnableFeature = true
Config.MaxValue = 100
Config.Webhook = "https://discord.com/api/webhooks/..."
```

---

## 🧩 Závislosti
- ESX Legacy / QBCore (uprav dle svého)
- Ox Inventory / NativeUI (pokud používáš)

---

## 📜 License
Tento script je chráněn licencí XYZ.
Nevydávej ho za svůj, neprodávej bez povolení.

---

## 🔗 Kontakt
- Discord: <Tvůj Discord>
- Web: <Tvůj web>
