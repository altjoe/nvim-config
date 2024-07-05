-- this is a autocommand to format neorg files
-- local function format_lines()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local line_count = vim.api.nvim_buf_line_count(bufnr)
--
-- 	for i = 0, line_count do
-- 		-- Move to the current line
-- 		vim.api.nvim_win_set_cursor(-1, { i, 0 })
-- 		-- Enter insert mode and then exit to trigger Neorg's formatting
-- 		-- vim.cmd("startinsert")
-- 		-- vim.cmd("stopinsert")
-- 		-- start insert wait for 0ms and then stop insert
-- 		vim.cmd("startinsert | sleep 99m | stopinsert")
-- 	end
-- end
--
-- -- Autocommand to trigger the function on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.norg",
-- 	callback = format_lines,
-- })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg" },
	command = "set conceallevel=3",
})

local function set_neorg_workspace()
	local cwd = vim.fn.getcwd()
	local index_norg = cwd .. "/index.norg"

	if vim.fn.filereadable(index_norg) == 1 then
		-- Extract the parent folder name from the current working directory
		local parent_folder = vim.fn.fnamemodify(cwd, ":t")
		vim.cmd("Neorg workspace " .. parent_folder)
	end
end

-- Autocommand to trigger on directory change
vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	callback = set_neorg_workspace,
})
