local server = "https://raw.githubusercontent.com/SynicalMX/nitidus/master/"
local dir = "nitidus/"
local install = true

local function createStructure()
    if fs.exists('/nitidus') == true then
        print("Nitidus is already installed.")
        install = false
    end
    fs.makeDir("nitidus")
    fs.makeDir("nitidus/lib")
end

local function f(name)
    return server..name
end

local function downloadFile(path, out)
    if not install then
        return
    end
    local request = http.get(f(path))
    local file = fs.open(out, "w")
    file.write(request.readAll())
    request.close()
    file.close()
end

createStructure()
downloadFile("src/nitidus.lua", "nitidus/init.lua")
downloadFile("src/lib/buttons.lua", "nitidus/lib/buttons.lua")
if install then
    print("Installed Nitidus v1.0 successfully.")
end
