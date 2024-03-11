--keymap for tab wr to run watchexec -r -e rs 'cargo run'
vim.keymap.set("n", "<Tab>wr", function()
	vim.cmd("w")

	_Source_config_lua()
	--on-busy-update=restart
	local dirs_to_watch = vim.g.dirs_to_watch or { "src", "tests" }
	local to_watch = " -- "
	for _, dir in ipairs(dirs_to_watch) do
		to_watch = to_watch .. " -w " .. dir
	end

	-- if the current file is in the bin directory, then we should run the binary instead of the project binary
	local binary = vim.g.project_binary
	if binary == nil then
		print("project_binary is not set")
		return
	end

	vim.cmd("belowright vsplit | terminal " .. "watchexec -r -e rs 'cargo run --bin " .. binary .. "'" .. to_watch)
end)

vim.keymap.set("n", "<Tab>rr", function()
	vim.cmd("w")

	_Source_config_lua()
	local binary = vim.g.project_binary
	if binary == nil then
		vim.cmd("belowright vsplit | terminal " .. "cargo run")
		return
	end
	vim.cmd("belowright vsplit | terminal " .. "cargo run --bin " .. binary)
end)
