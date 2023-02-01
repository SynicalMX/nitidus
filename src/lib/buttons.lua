local buttons = {}

function buttons:createButton(xmin, ymax, xmax, ymin, onclick, initText)
    if not initText then
        initText = "Button"
    end

    if not onclick then
        error("Button '"..initText.."' was not provided an onclick function")
    end

    local button = {
        ["properties"] = {
            ["pallete"] = {
                ["main"] = colors.lime,
                ["shadow"] = colors.lightGray,
                ["text"] = colors.white,
            },
            ["text"] = initText
        },
        ["bounds"] = {
            ["xmin"] = xmin,
            ["ymax"] = ymax,
            ["xmax"] = xmax,
            ["ymin"] = ymin
        }
    }

    function button:setText(text)
        buttons:setText(self, text)
    end

    function button:draw()
        -- Get center to write button text
        local cenX = math.floor(((self.bounds.xmin + self.bounds.xmax) / 2) - (string.len(self.properties.text) / 2))
        local cenY = math.floor((self.bounds.ymin + self.bounds.ymax) / 2)

        -- Draw shadow
        paintutils.drawFilledBox(self.bounds.xmin-1, self.bounds.ymax+1, self.bounds.xmax-1, self.bounds.ymin+1, self.properties.pallete.shadow)
        -- Draw button
        paintutils.drawFilledBox(self.bounds.xmin, self.bounds.ymax, self.bounds.xmax, self.bounds.ymin, self.properties.pallete.main)

        -- Write button text
        term.setCursorPos(cenX, cenY)
        term.setBackgroundColor(self.properties.pallete.main)
        term.setTextColor(self.properties.pallete.text)
        term.write(self.properties.text)

        -- Click detection
        parallel.waitForAll(function ()
            while true do
                local event, b, x, y = os.pullEvent("mouse_click")
                if b == 1 and x >= self.bounds.xmin and x <= self.bounds.xmax and y >= self.bounds.ymin and y <= self.bounds.ymax then
                    self.onclick()
                end
            end
        end)
    end

    return button
end

function buttons:setText(button, text)
    button.properties.text = text
end

return buttons
