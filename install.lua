local server = "https://raw.githubusercontent.com/SynicalMX/nitidus/master/"
local dir = "nitidus/"

local function createStructure()
    fs.makeDir("nitidus")
    fs.makeDir("nitidus/lib")
end

local function f(name)
    return server..name
end

local function downloadFile(path, out)
    local request = http.get(f(path))
    local file = fs.open(out, "w")
    file.write(request.readAll())
    request.close()
    file.close()
end

createStructure()
downloadFile("src/nitidus.lua", "nitidus/init.lua")
downloadFile("src/lib/buttons.lua", "nitidus/lib/buttons.lua")
print("Installed Nitidus v1.0 successfully.")
