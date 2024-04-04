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
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-n>",
			node_incremental = "<C-n>",
			scope_incremental = "<C-s>",
			node_decremental = "<C-r>",
		},
	},
})
