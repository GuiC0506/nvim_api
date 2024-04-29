require("autocmd")
local mymodule = require("my-module")
--[[ mymodule.sum() ]]
--[[ _G.test() ]]
--[[ vim.api.nvim_command("echo \"Hello world\"") ]]
--[[ vim.cmd("echo \"hello world\"") ]]
--[[ vim.cmd [[ ]]
--[[     echo "Hello world" ]]
--]]

print(_VERSION)

-- pairs: iterates over string and numeric keys in a table. Order not garanteed
-- ipairs: iterates only over numeric keys in a table or over an array. Order garanteed

local table = {
    ["Churros"] = function()
        print("Churros")
    end,
    [1] = "Churros"
}

print("=================")
for key, value in pairs(table) do
    print(key, value)
end

print("=================")
for x, y in pairs({ x = 5, y = 6 }) do
    print(x, y)
end

print("=================")
for i, value in ipairs { 1, 2, 3 } do
    print(i, value * 2)
end

vim.keymap.set('n', '<leader>T', ': echo "turned on"')
