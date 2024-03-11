-- Source the config.lua in the python project directory

-- Split terminal and activate conda for the current project
vim.keymap.set("n", "<Leader>st", function()
	-- run RooterToggle
	-- vim.cmd("RooterToggle")
	vim.cmd("rightbelow vsplit | terminal")
	vim.cmd("startinsert")

	_Source_config_lua()

	-- if CONDA_NAME is not nil
	if vim.env.CONDA_NAME ~= nil then
		print("Conda environment detected: " .. vim.env.CONDA_NAME)
		local conda = "conda activate " .. vim.env.CONDA_NAME .. "<CR>"
		vim.api.nvim_input(conda)
	else
		vim.env.CONDA_NAME = "base"
		print("Conda environment not detected, using base")
	end

	-- get working directory
	local cwd = "cd " .. vim.fn.getcwd() .. "<CR>"
	vim.api.nvim_input(cwd)
end)

-- Split terminal horizontally and run the activate python file
vim.keymap.set("n", "<Tab>hrp", function()
	vim.cmd("w")

	_Source_config_lua()

	local pathToPython = vim.g.python3_host_prog or "python3"

	vim.cmd("belowright split | terminal " .. pathToPython .. " %")
end)

-- Split terminal vertically and run the activate python file
vim.keymap.set("n", "<Tab>rp", function()
	vim.cmd("w")

	_Source_config_lua()

	local pathToPython = vim.g.python3_host_prog or "python3"

	vim.cmd("belowright vsplit | terminal " .. pathToPython .. " %")
end)

---- pytest to run in current working directory
--pytest hotkey
--split to new terminal and run pytest
vim.keymap.set("n", "<leader>tp", function()
	vim.cmd("w")

	_Source_config_lua()

	local pathToPython = vim.g.python3_host_prog or "python3"
	vim.g.pytest = vim.g.pytest or vim.fn.getcwd()
	vim.cmd("belowright vsplit | terminal " .. pathToPython .. " -m pytest -s " .. vim.g.pytest)
end)

---- pytest to run the test for the current file
--pytest hotkey
--split to new terminal and run pytest
vim.keymap.set("n", "<leader>tip", function()
	vim.cmd("w")

	_Source_config_lua()

	local pathToPython = vim.g.python3_host_prog or "python3"

	-- get current path
	local path = vim.fn.expand("%:p:h")
	-- get current file name
	local name = vim.fn.expand("%:t")
	local test = ""
	-- if test not in name add it then run pytest
	if not string.find(name, "_test") then
		-- use test file to run pytest
		name = name:gsub(".py", "")
		test = path .. "/" .. name .. "_test.py"
	else
		test = path .. "/" .. name
	end
	print(test)

	vim.cmd("belowright vsplit | terminal " .. pathToPython .. " -m pytest -s " .. test)

	-- vim.cmd("belowright vsplit | terminal " .. pathToPython .. " -m pytest")
end)

-- run flask with the current file
vim.keymap.set("n", "<leader>fr", function()
	vim.cmd("w")

	_Source_config_lua()

	local pathToPython = vim.g.python3_host_prog or "python3"

	-- get current path

	-- export env variables
	vim.cmd("let $FLASK_APP = '" .. vim.g.flaskapp .. "'")

	vim.cmd(
		"belowright vsplit | terminal " .. pathToPython .. " -m flask run "
		-- .. vim.fn.expand("%:t:r")
	)
end)
-- pytest to run for the current function
vim.keymap.set("n", "<leader>tf", function()
	vim.api.nvim_input("W")

	_Source_config_lua()

	local currentpos = vim.fn.getpos(".")
	print("Current position: ", currentpos)

	local foundDefinition = vim.fn.search("def ", "bW")
	if foundDefinition == 0 then
		print("No function definition found")
		return
	end

	print("Found function definition at line: " .. foundDefinition)

	local currentLine = vim.fn.getline(foundDefinition)

	local function_name = currentLine:match("def (%w+)")

	local test_functionname = "test_" .. function_name
	local currentpath = vim.fn.expand("%:p:h")
	local currentfile = vim.fn.expand("%:t")
	currentfile = currentfile:gsub(".py", "")

	local currenttestpath = currentpath .. "/" .. currentfile .. "_test.py"

	print("Running test for function: " .. test_functionname, "in file:", currenttestpath)

	vim.cmd(
		"belowright vsplit | terminal "
			.. vim.g.python3_host_prog
			.. " -m pytest "
			.. currenttestpath
			.. " -k "
			.. test_functionname
	)
end)
