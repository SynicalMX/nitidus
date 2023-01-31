# nitidus-ui

A UI library for ComputerCraft

# Quick Start

```lua
-- Require Nitidus
local nitidus = require("niditdus/niditus.lua")

-- Create button
local button = nitidus.buttons:createButton(17, 7, 34, 12)

-- Call draw function
while true do
    button:draw()
end
```