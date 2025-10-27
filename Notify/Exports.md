#### Types
Types: 'success', 'error', 'warning', 'info', 'inform'
Positions: 'top-right', 'top-middle', 'top-left'

#### CLIENT-SIDE EXPORT:
```lua
  exports['fs_notify']:SendNotification({ type = 'success', title = 'Title', description = 'Description', duration = 5000, position = 'top-right' })
```

#### SERVER-SIDE EXPORT (for specific player):
```lua
  exports['fs_notify']:NotifyPlayer(source, { type = 'success', title = 'Title', description = 'Description', duration = 5000, position = 'top-right' })
```

#### SERVER-SIDE EXPORT (for all players):
```lua
  exports['fs_notify']:NotifyAll({ type = 'success', title = 'Title', description = 'Description', duration = 5000, position = 'top-right' })
```