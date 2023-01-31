local buttons = {}

function buttons:createButton(xmin, ymax, xmax, ymin, initText)
    local button = {}

    if not initText then
        initText = "Button"
    end

    local bounds = {
        ["xmin"] = xmin,
        ["ymax"] = ymax,
        ["xmax"] = xmax,
        ["ymin"] = ymin
    }

    local properties = {
        ["pallete"] = {
            ["main"] = colors.lime,
            ["shadow"] = colors.lightGray
        },
        ["text"] = initText
    }

    table.insert(button, bounds)
    table.insert(button, properties)

    function button:setText(text)
        buttons:setText(button, text)
    end

    function button:draw()
        paintutils.drawFilledBox(button.bounds.xmin-1, button.bounds.ymax+1, button.bounds.xmax-1, button.bounds.ymin+1, button.properties.pallete.shadow)
        paintutils.drawFilledBox(button.bounds.xmin, button.bounds.ymax, button.bounds.xmax, button.bounds.ymin, button.properties.pallete.main)

        -- Click detection
        parallel.waitForAll(function ()
            local event, b, x, y = os.pullEvent("mouse_click")
            if b == 1 then
                if x >= button.bounds.xmin and x <= button.bounds.xmax and y >= button.bounds.ymin and y <= button.bounds.ymax then
                    os.queueEvent("button_click", button, x, y)
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