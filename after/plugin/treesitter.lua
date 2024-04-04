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
		"go",
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
			init_selection = "<M-m>",
			node_incremental = "<M-m>",
			-- scope_incremental = "<C-M-m>",
			node_decremental = "<M-n>",
		},
	},
})
