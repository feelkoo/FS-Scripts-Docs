#### Categories - Config
```lua
{
    name = 'weapons', -- ID of category
    label = 'Weapons', -- Name of category
    icon = 'fas fa-gun', -- Font awesome category icon
    color = '#e74c3c', -- Color of category
    description = 'Craft weapons', -- Description of category
    levelRequired = 1, -- From what level player will see this category
}
```

#### Crafting Benches / Recipes - Config
1. Crafting Bench
```lua
{
    name = 'weapons_bench', -- ID of bench
    coords = vector3(844.4180, -1035.3782, 28.1948), -- Coords of bench place for target
    radius = 1.5, -- Radius for a player 
    categories = {'weapons', 'attachments', 'ammo'}, -- Categories of benches // Example for food benche u have to make a category: food. 
    label = 'Weapons Crafting', -- Name
    description = 'Craft weapons, attachments and ammunition', -- Description
    icon = 'fas fa-gun', -- Fontawesome ikon
    blip = { enabled = false, sprite = 110, color = 1, scale = 0.8 }, -- Blip on map / Default: false
    jobs = {}, -- Empty for everyone, or {'police', 'mechanic'} // ESX jobs or QBCore jobs
    gangs = {}, -- For gang restrictions (QBCore) // None one is using but i put it there aswell
    requiredItem = nil, -- Item required to use bench
}
```
#####

2. Recipes craft
```lua
{
    category = 'weapons', -- Category
    result = 'weapon_pistol', -- Item
    resultLabel = 'Pistol', -- Label of item
    resultAmount = 1, -- Quantity of craft
    resultImage = 'weapon_pistol.png', -- Images from ox_inventory / qb-inventory etc..
    description = 'A basic semi-automatic pistol for self-defense.', -- Description
    craftTime = 15000, -- How long it will craft in ms
    levelRequired = 0, -- What level player need to craft this item
    xpGained = 50, -- How many XP will player recieve after finish craft
    successRate = 100, -- % chance of success craft (Low % is fail)
    jobs = {}, -- Empty for everyone, or {'police', 'mechanic', 'fraction name'} // ESX jobs or QBCore jobs
    gangs = {}, -- For gang restrictions (QBCore) // None one is using but i put it there aswell
    ingredients = { -- Materials which player need for craft this item
        {item = 'steel_parts', amount = 10, label = 'Steel Parts'},
        {item = 'plastic', amount = 5, label = 'Plastic'},
        {item = 'spring', amount = 3, label = 'Springs'},
    },
    requiresBlueprint = false, -- Requires 'blueprint_pistol' item // If is it true, item its not showed in crafting. Only will be showed when a player will use blueprint of this item.
}
```