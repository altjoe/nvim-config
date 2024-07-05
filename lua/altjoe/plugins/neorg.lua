local M = {
	"nvim-neorg/neorg",
	ft = "norg",
	dependencies = {
		"luarocks.nvim", -- this is it.
		-- "nvim-treesitter/nvim-treesitter",
		-- "nvim-treesitter/nvim-treesitter-textobjects",
		-- "nvim-cmp",
		-- "nvim-lua/plenary.nvim",
	},
	-- build = ":Neorg sync-parsers", -- and delete this line.
	cmd = "Neorg",
}

local modules = {
	["core.defaults"] = {},
	["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
	["core.integrations.nvim-cmp"] = {},
	["core.concealer"] = { config = { folds = true, auto_fold_on_load = false, icon_preset = "basic" } },
	["core.keybinds"] = {
		-- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
		config = {
			default_keybinds = true,
			neorg_leader = "<Leader><Leader>",
		},
	},
	["core.dirman"] = {
		config = {
			workspaces = {
				notes = "~/notes",
				mindpalace = "~/mind-palace",
			},
		},
	},
	["core.autocommands"] = {},
	["core.integrations.treesitter"] = {},
	["core.esupports.indent"] = {
		config = {
			dedent = true,
			format_on_escape = true,
			format_on_enter = true,
		},
	},
}
M.opts = {
	load = modules,
}
return M
