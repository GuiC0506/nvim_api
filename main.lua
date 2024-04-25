vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua" },
    callback = function()
        vim.schedule(function() print("Lua file added") end)
    end
})
