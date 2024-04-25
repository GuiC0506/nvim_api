vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua" },
    callback = function()
        vim.schedule(function() print("Lua file added") end)
    end
})

local humanReadableTable = vim.inspect({ favoriteDog = "Churros" })
print(humanReadableTable)


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
