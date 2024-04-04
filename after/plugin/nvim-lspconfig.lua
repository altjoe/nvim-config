-- Setup language servers.

local lspconfig = require("lspconfig")
---- installed lsp servers
lspconfig["pyright"].setup({})
lspconfig["svelte"].setup({})
lspconfig["lua_ls"].setup({})
lspconfig["tsserver"].setup({})
lspconfig["rust_analyzer"].setup({})
lspconfig["gdscript"].setup({})
lspconfig["gopls"].setup({})

function load_sqls_connections()
	_Source_config_lua()
	if vim.g.sqls_driver == nil then
		vim.g.sqls_driver = "postgresql"
	end

	if vim.g.sqls_url == nil then
		vim.g.sqls_url = "host=localhost user=postgres password=postgres dbname=postgres port=5432 sslmode=disable"
	end
	print(vim.g.sqls_driver)
	print(vim.g.sqls_url)
	return {
		{
			driver = vim.g.sqls_driver,
			dataSourceName = vim.g.sqls_url,
		},
	}
end

-- root_dir is the config.lua file

-- lspconfig["sqls"].setup({
-- 	connections = function() end,
-- 	cmd = { "sqls" },
-- 	root_dir = lspconfig.util.root_pattern("config.lua"),
-- 	settings = {
-- 		sqls = {
-- 			connections = load_sqls_connections(),
-- 		},
-- 	},
-- })
-- lspconfig["sqlfluff"].setup({})
---------------------------

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
