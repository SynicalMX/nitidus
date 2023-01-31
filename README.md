# nitidus-ui

A UI library for ComputerCraft

# Quick Start

```lua
-- Require Nitidus
local nitidus = require("niditdus")

-- Create button
local button = nitidus.buttons:createButton(17, 7, 34, 12)

-- Call draw function
button:draw()

-- Main loop
while true do
    local event, button, x, y = os.pullEvent("button_click")
    if button == button then
        print("Click!")
        break
    end
end
```