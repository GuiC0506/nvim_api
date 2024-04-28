require("autocmd")
local mymodule = require("my-module")
--[[ mymodule.sum() ]]
--[[ _G.test() ]]
vim.api.nvim_command("echo \"Hello world\"")
vim.cmd("echo \"hello world\"")
vim.cmd [[ 
    echo "Hello world"
]]

print(_VERSION)

