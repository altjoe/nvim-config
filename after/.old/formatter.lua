-- Utilities for creating configurations
local util = require("formatter.util")
USER = vim.fn.expand("$USER")
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
		-- svelte = { require(USER .. ".formatter.filetypes.svelte").prettier },
		svelte = { require("formatter.filetypes.svelte").prettier },
		rust = { require("formatter.filetypes.rust").rustfmt },
		gd = { require(USER .. ".formatter.filetypes.gdscript").gdformat },
		-- gdscript = { require("altjoe.formatter.filetypes.gdscript").gdformat },
		json = { require("formatter.filetypes.json").prettier },
		sql = { require("formatter.filetypes.sql").pgformat },
		go = { require("formatter.filetypes.go").gofmt },
		typescript = { require("formatter.filetypes.typescript").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		-- templ = { require("altjoe.formatter.filetypes.templ").templfmt },
		html = { require("formatter.filetypes.html").prettier },
		templ = { require(USER .. ".formatter.filetypes.templ").templ_fmt },
	},
})
