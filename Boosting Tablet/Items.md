# Items

## ox_inventory
```lua
['delivery_tablet'] = {
    label = 'Delivery Tablet',
    weight = 500,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'delivery_tablet.png',
        export = 'fs_boosting_tablet.useTablet',
        anim = {
            dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@base',
            clip = 'base',
            flag = 49
        },
        prop = {
            model = `prop_cs_tablet`,
            pos = vec3(0.0, 0.0, 0.03),
            rot = vec3(0.0, 0.0, 0.0)
        },
        disable = { move = false, car = false, combat = true },
        usetime = 1000
    }
},

['delivery_paper'] = {
    label = 'Paper with hint',
    weight = 10,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'delivery_paper.png',
        export = 'fs_boosting_tablet.usePaper',
        anim = {
            dict = 'missheistdockssetup1clipboard@idle_a',
            clip = 'idle_a',
            flag = 49
        },
        disable = { move = false, car = false, combat = true },
        usetime = 500
    }
},

['gps_tracker'] = {
    label = 'GPS Tracker',
    weight = 1,
    stack = true,
    close = true,
    consume = 1,
    client = {
        image = 'gps_tracker.png',
        export = 'fs_boosting_tablet.useTrackingDevice',
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer',
            flag = 49
        },
        disable = { move = true, car = false, combat = true },
        usetime = 2000
    }
}
```

## qb-core (add to `qb-core/shared/items.lua`)
```lua
delivery_tablet = {name = 'delivery_tablet', label = 'Delivery Tablet', weight = 500, type = 'item', image = 'delivery_tablet.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'Boosting tablet'},
delivery_paper = {name = 'delivery_paper', label = 'Paper with hint', weight = 10, type = 'item', image = 'delivery_paper.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Hint for boosting mission'},
gps_tracker = {name = 'gps_tracker', label = 'GPS Tracker', weight = 100, type = 'item', image = 'gps_tracker.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Installs a tracker in a boost vehicle'},
```

## Shop items (Ethereum shop)
- Each entry in `Config.EthereumShop.items` must exist in your inventory (e.g. `lockpick`, `armour`). Use your existing definitions or refer to `install/ox_inventory-example.md`.
