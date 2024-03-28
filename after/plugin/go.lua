-- keybind for tab rg for running go on the currentfile
--
vim.keymap.set("n", "<tab>rg", function()
	-- split terminal to the right
	-- get go file name
	local currentfile = vim.fn.expand("%:p")
	local currentpath = vim.fn.expand("%:p:h")
	print(currentpath)
	vim.cmd("belowright vsplit | terminal cd " .. currentpath .. " && go run .")
end)

-- run go on the current file
vim.keymap.set("n", "<tab>rfg", function()
    -- split terminal to the right
    -- get go file name
    local currentfile = vim.fn.expand("%:p")
    local currentpath = vim.fn.expand("%:p:h")
    print(currentpath)
    vim.cmd("belowright vsplit | terminal cd " .. currentpath .. " && go run " .. currentfile)
end)

-- keybind for tab ra for running air which is a go hotreload
vim.keymap.set("n", "<tab>ra", function()
	-- split terminal to the right
	-- get go file name
	-- local currentfile = vim.fn.expand("%:p")
	local currentpath = vim.fn.expand("%:p:h")
	print(currentpath)
	vim.cmd("belowright vsplit | terminal cd " .. currentpath .. " && air")
end)


-- keybind for tab gg for running go generate
vim.keymap.set("n", "<tab>gg", function()
    -- split terminal to the right
    -- get go file name
    -- local currentfile = vim.fn.expand("%:p")
    local currentpath = vim.fn.expand("%:p:h")
    print(currentpath)
    vim.cmd("belowright vsplit | terminal cd " .. currentpath .. " && go generate")
end)
