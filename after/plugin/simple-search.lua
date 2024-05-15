vim.keymap.set("n", "?", function()
	--  get clipboard
	local clipboard = vim.fn.getreg("+")
	-- add clipboard to / input prompt for user editing
	vim.api.nvim_feedkeys("/" .. clipboard, "n", true)
end)
