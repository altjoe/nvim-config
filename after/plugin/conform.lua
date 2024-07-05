function FormatNeorg()
	local save_cursor = vim.fn.getpos(".")

	-- move cursor to top of file
	vim.fn.cursor(1, 0)

	--  use = to format G to move to end of file

	vim.cmd("normal! gg=G")

	-- move cursor back to original position
	vim.fn.setpos(".", save_cursor)
end

-- autocmd on .norg files
vim.cmd("autocmd BufWritePre *.norg lua FormatNeorg()")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "autopep8" },
		-- Use a sub-list to run only the first available formatter
		-- javascript = { { "prettierd", "prettier" } },
		go = { "gofmt" },
		templ = { "templ", "injected" },
		svelte = { "prettier" },

		javascript = { "biome" },
		tmpl = { "templ" },
		-- IndentWidth: 4
		c = { "clang-format" },
		http = { "prettier" },
		json = { "prettier" },
		-- norg = { "norg-fmt" },
	},
	formatters = {
		["norg-fmt"] = {
			command = "norg-fmt",
			stdin = true,
		},
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
