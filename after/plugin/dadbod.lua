-- keymap for leader db to open a database connection with dadbod
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dbout",
	callback = function()
		vim.wo.foldenable = false
	end,
})
vim.keymap.set("n", "<leader>db", function()
	-- run :DBUIToggle to open a database connection
	vim.api.nvim_command("DBUIToggle")
end, { noremap = true, silent = true })
