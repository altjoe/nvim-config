vim.keymap.set("n", "<leader>tm", function()
	-- run make test
	local cwd = vim.fn.getcwd()
	local makefile = cwd .. "/Makefile"

	if vim.fn.filereadable(makefile) == 1 then
		vim.api.nvim_command("rightbelow vsplit | terminal make test")
	else
		print("No Makefile found in " .. cwd)
	end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<tab>rm", function()
	-- run make
	local cwd = vim.fn.getcwd()
	local makefile = cwd .. "/Makefile"

	if vim.fn.filereadable(makefile) == 1 then
		vim.api.nvim_command("rightbelow vsplit | terminal make")
	else
		print("No Makefile found in " .. cwd)
	end
end, { noremap = true, silent = true })
