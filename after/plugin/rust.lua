--keymap for tab wr to run watchexec -r -e rs 'cargo run'
vim.keymap.set("n", "<Tab>wr", function()
	vim.cmd("w")

	_Source_config_lua()
	--on-busy-update=restart
	vim.cmd("belowright vsplit | terminal " .. "watchexec -r -e rs 'cargo run' ")
end)

vim.keymap.set("n", "<Tab>rr", function()
	vim.cmd("w")

	_Source_config_lua()

	vim.cmd("belowright vsplit | terminal " .. "cargo run")
end)
