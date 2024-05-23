require("nvim-treesitter.configs").setup({
	ensure_installed = {
		-- "dockerfile",
		"hurl",
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
		"templ",
		"c",
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
	-- filetype = {
	-- 	-- templ = "html",
	-- 	html = "templ",
	-- },
	filetype = {
		h = "c",
	},
})
