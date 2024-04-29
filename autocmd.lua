vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua" },
    callback = function()
        vim.schedule(function() print("Lua file added") end)
    end
})

-- prevent autocommand stacking its "event listener""
local augroup = vim.api.nvim_create_augroup("augroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Entering Buffer 0'", group = augroup, buffer = 0 })
vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Entering Buffer this buffer'", group = augroup })
vim.api.nvim_create_autocmd({ "BufLeave" }, {
    pattern = "*",
    -- like command, but via lua function
    callback = function()
        --[[ print("Leaving the current buffer") ]]
    end,
    group = augroup
})

vim.api.nvim_create_autocmd({ "BufWritePost"}, {
    group = vim.api.nvim_create_augroup("testing", { clear = true }),
    pattern = "autocmd.lua",
    callback = function()
        vim.api.nvim_buf_set_lines(21, 0, 0, false, { "Hello in the buffer" })
    end
})

print(vim.fn.expand("~"))
print(vim.api.nvim_get_current_buf())

local humanReadableTable = vim.inspect({ favoriteDog = "Churros" })
local runtimepath = vim.inspect(vim.api.nvim_list_runtime_paths())
--[[ print(humanReadableTable) ]]
--[[ print(runtimepath) ]]

local fooX = function(a, b)
    print("FooX: " .. tostring(a) .. " | " .. tostring(b))
end

local fooY = function(opts)
    print("FooY: " .. tostring(opts.foo) .. " | " .. tostring(opts.name))
end

local fooZ = function(text)
    print("FooZ: " .. tostring(text))
end

fooX("churros", "CHURROS")
fooX("churros")

-- the parenthesis can be ommtided if the function takes one string parameter, or a literal table
fooY({ foo = true, name = "Churros" })
fooY { foo = true, name = "Churros" }
fooY { name = "Churros" }

fooZ("ChurrosZ")
fooZ "ChurrosZ"
