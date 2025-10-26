# 🔧 Exporty

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac est sed sapien blandit sollicitudin. Vestibulum ut mi gravida, molestie justo eu, sollicitudin libero. Suspendisse non nibh sit amet ligula porta imperdiet. Vivamus accumsan eleifend purus at feugiat. Praesent nisl massa, porta et vehicula vel, gravida et elit. Ut blandit consequat ullamcorper. Maecenas nec libero ultricies, fringilla nulla at, rutrum arcu. Curabitur et diam id justo imperdiet semper. Pellentesque tincidunt cursus urna id porttitor.

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