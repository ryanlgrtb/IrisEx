local fs = require('@lune/fs')
local net = require('@lune/net')
local serde = require('@lune/serde')
local process = require('@lune/process')

local file = net.request(`https://github.com/SirMallard/Iris/releases/latest/download/Iris.rbxm`)
if file.ok then
    print(`Writing {#file.body} bytes to Iris.rbxm`)
    fs.writeFile('Iris.rbxm', file.body)
    
    print(`Bundling Iris.rbxm`)
    
    local result = process.exec('lune', {
        'run', 'wax', 'bundle', 'input=Iris.rbxm'
    })
    print(result.stdout)
end
