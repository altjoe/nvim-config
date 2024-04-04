-- keybind to run DevdocsOpen

vim.keymap.set("n", "<tab>dd", function()
	print("Opening DevDocs")
	vim.cmd("DevdocsOpenCurrent")
end, { noremap = true, silent = true })
