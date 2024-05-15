vim.keymap.set("n", "<leader>th", function()
	-- run hurl --test vim.g.hurl_tests
	-- hurl_tests is a array

	local currentfile = vim.fn.expand("%:p")
	-- if it is a .hurl file, run only that file
	if string.match(currentfile, "%.hurl$") then
		vim.cmd("!hurl --test " .. currentfile)
		return
	end
end)
