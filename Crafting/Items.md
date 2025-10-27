## Inventories items
Images for items can be downloaded here! -> https://items.bit-scripts.com/

1. For ox_inventory examples
```lua
['steel_parts'] = {
    label = 'Steel Parts',
    weight = 100,
    stack = true,
    close = true,
    description = 'Used for crafting various items'
},
['plastic'] = {
    label = 'Plastic',
    weight = 50,
    stack = true,
    close = true,
    description = 'Used for crafting various items'
},
['spring'] = {
    label = 'Spring',
    weight = 25,
    stack = true,
    close = true,
    description = 'Used for crafting various items'
}
```
#####

2. For qb-inventory examples
```lua
steel_parts = {name = 'steel_parts', label = 'Steel Parts', weight = 100, type = 'item', image = 'steel_parts.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Used for crafting various items'},
plastic = {name = 'plastic', label = 'Plastic', weight = 50, type = 'item', image = 'plastic.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Used for crafting various items'},
spring = {name = 'spring', label = 'Spring', weight = 25, type = 'item', image = 'spring.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Used for crafting various items'},
```