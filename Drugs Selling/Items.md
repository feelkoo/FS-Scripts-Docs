# Items

## ox_inventory
```lua
['cocaine_baggy'] = {
    label = 'Cocaine Baggy',
    weight = 1,
    stack = true,
    close = true,
    description = 'Pure white powder'
}
```

## qb-core
```lua
cocaine_baggy = {
    name = 'cocaine_baggy',
    label = 'Cocaine Baggy',
    weight = 1,
    type = 'item',
    image = 'cocaine_baggy.png',
    unique = false,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = 'Pure white powder'
}
```

## Additional items
- Add every entry from `Config.Drugs` (e.g. `weed_baggy`, `meth_baggy`) with the same structure.
- If you plan to use `black_money`, ensure your framework grants players the required account.
