-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	-- log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = { require("formatter.filetypes.lua").stylua },
		python = { require("formatter.filetypes.python").autopep8 },
		svelte = { require("formatter.filetypes.svelte").prettier },
		rust = { require("formatter.filetypes.rust").rustfmt },
		gdscript = { require("altjoe.formatter.filetypes.gdscript").gdformat },
		json = { require("formatter.filetypes.json").prettier },
		sql = { require("formatter.filetypes.sql").pgformat },
	},
})
