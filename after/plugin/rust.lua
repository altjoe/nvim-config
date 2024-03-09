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

	vim.cmd("belowright vsplit | terminal " .. "watchexec -r -e rs 'cargo run'" .. to_watch)
end)

vim.keymap.set("n", "<Tab>rr", function()
	vim.cmd("w")

	_Source_config_lua()

	vim.cmd("belowright vsplit | terminal " .. "cargo run")
end)
