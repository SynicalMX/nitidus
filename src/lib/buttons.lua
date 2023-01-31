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

    function button:setText(text)
        buttons:setText(button, text)
    end

    return button
end

function buttons:setText(button, text)
    button.properties.text = text
end

return buttons