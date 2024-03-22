-- keybind for tab rg for running go on the currentfile
--
vim.keymap.set("n", "<tab>rg", function()
	-- split terminal to the right
    -- get go file name
    local currentfile = vim.fn.expand("%:p")
    local currentpath = vim.fn.expand("%:p:h")
    print(currentpath)
	vim.cmd("belowright vsplit | terminal cd " .. currentpath .. " && go run " .. currentfile)
end)
