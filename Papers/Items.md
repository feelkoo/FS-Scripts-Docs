# Items

## ox_inventory
```lua
['fs_paper_example'] = {
    label = 'Example Paper',
    weight = 10,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'fs_paper.png',
        export = 'fs_papers.usePaper',
        anim = {
            dict = 'missheistdockssetup1clipboard@idle_a',
            clip = 'idle_a',
            flag = 49
        },
        prop = {
            model = `prop_notepad_01`,
            pos = vec3(0.0, 0.0, 0.0),
            rot = vec3(0.0, 0.0, 0.0)
        },
        disable = { move = false, car = false, combat = true },
        usetime = 500
    }
}
```

## qb-core
```lua
fs_paper_example = {
    name = "fs_paper_example",
    label = "Paper Example",
    weight = 15000,
    type = "item",
    image = "fs_paper.png",
    unique = true,
    useable = true,
    shouldClose = false,
    combinable = nil,
    description = "Paper Example"
}
```

## Notes
- `usetime` must match `Config.ProgressBar.duration`.
- For special papers (e.g. boosting hints) simply add another entry to `Config.Papers` and the corresponding inventory item.
