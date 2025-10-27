## Blackmarket Tablet Item
Images for items can be downloaded here! -> https://items.bit-scripts.com/

### ox_inventory (ESX)
Add to `ox_inventory/data/items.lua`:

```lua
['blackmarket_tablet'] = {
    label = 'Blackmarket Tablet',
    weight = 500,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'blackmarket_tablet.png',
        export = 'fs_blackmarket.useTablet',
        anim = {
            dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@base',
            clip = 'base',
            flag = 49
        },
        prop = {
            model = `prop_cs_tablet`,
            bone = 60309,
            pos = vec3(0.03, 0.002, -0.0),
            rot = vec3(10.0, 160.0, 0.0)
        },
        disable = { move = false, car = false, combat = true },
        usetime = 1500
    }
}
```

### qb-inventory (QBCore)
Add to `qb-core/shared/items.lua`:

```lua
blackmarket_tablet = {name = "blackmarket_tablet", label = "Blackmarket Tablet", weight = 500, type = "item", image = "blackmarket_tablet.png", unique = true, useable = true, shouldClose = false, combinable = nil, description = "A tablet for accessing the blackmarket"},
```

## Blackmarket Items Configuration / Examples 
Configure items to sell in `config.lua`:

```lua
Config.Items = {
    { name = 'WEAPON_PISTOL', label = 'Pistol', price = 5000, type = 'weapon', currency = 'money' },
    { name = 'ammo-9', label = '9mm Ammo (50x)', price = 500, type = 'item', amount = 50, currency = 'money' },
    { name = 'lockpick', label = 'Lockpick', price = 250, type = 'item', amount = 1, currency = 'money' },
}
```

### OX_inventory items
Example items for `ox_inventory/data/items.lua`:

```lua
['baggy_weed'] = {
    label = 'Weed Baggy',
    weight = 1,
    stack = true,
    close = true,
}
```

### qb-inventory items
Example items for `qb-core/shared/items.lua`:

```lua
baggy_weed = {name = "baggy_weed", label = "Weed Baggy", weight = 1, type = "item", image = "baggy_weed.png", unique = false, useable = false, shouldClose = true, combinable = nil, description = "Weed baggy"},
```