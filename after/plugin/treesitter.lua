require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"dockerfile",
		"svelte",
		"lua",
		"javascript",
		"typescript",
		"vimdoc",
		"yaml",
		"json",
		"html",
		"css",
		"rust",
		"markdown",
		"sql",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
