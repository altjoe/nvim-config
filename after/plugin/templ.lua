vim.cmd("autocmd BufRead,BufNewFile *.templ setfiletype templ")

vim.keymap.set("n", "<M-g>", function()
	-- run templ generate command without openingn a terminal
	vim.cmd("silent !templ generate")
end)
