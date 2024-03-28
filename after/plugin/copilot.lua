
-- restart copilot service
vim.keymap.set("n", "<leader>co", function()
	-- Copilot !toggle
	vim.api.nvim_command("Copilot toggle")

	vim.api.nvim_command("Copilot status")
end)
