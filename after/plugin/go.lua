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

-- keybind for leader tg for running go test on the current file
vim.keymap.set("n", "<leader>tg", function()
	-- split terminal to the right
	-- get go file name
	-- local currentfile = vim.fn.expand("%:p")
	local currentpath = vim.fn.expand("%:p:h")
	print(currentpath)
	vim.cmd("belowright vsplit | terminal cd " .. currentpath .. " && go test -v ./...")
end)

-- vim go migration
vim.keymap.set("n", "<leader>gm", function()
	_Source_config_lua()
	-- split terminal to the right
	-- get go file name
	-- local currentfile = vim.fn.expand("%:p")
	local source = vim.g.migrate_source or "file://migrations"
	local database = vim.g.migrate_database or "postgres://postgres:postgres@localhost:5432/postgres"
	print(source)
	print(database)

	local currentpath = vim.fn.expand("%:p:h")
	vim.cmd(
		"belowright vsplit | terminal cd "
			.. currentpath
			.. " && migrate -source "
			.. source
			.. " -database "
			.. database
			.. " up"
	)
end)

vim.keymap.set("n", "<leader>gmd", function()
	_Source_config_lua()
	-- split terminal to the right
	-- get go file name
	-- local currentfile = vim.fn.expand("%:p")
	local source = vim.g.migrate_source or "file://migrations"
	local database = vim.g.migrate_database or "postgres://postgres:postgres@localhost:5432/postgres"
	print(source)
	print(database)

	local currentpath = vim.fn.expand("%:p:h")
	vim.cmd(
		"belowright vsplit | terminal cd "
			.. currentpath
			.. " && migrate -source "
			.. source
			.. " -database "
			.. database
			.. " down"
	)
end)
