function _Source_config_lua()
	print("Sourcing config.lua...")
	-- if already sourced return

	local cwd = vim.fn.getcwd() .. "/config.lua"

	-- if file exists
	if vim.fn.filereadable(cwd) == 0 then
		print("config.lua file does not exist in working directory")
		return
	end

	vim.cmd("source " .. cwd)
	return true
end

-- local user = os.getenv("USER")
-- print("Hello " .. user)
USER = vim.fn.expand("$USER")
print("Hello " .. USER)

require(USER .. ".core")
require(USER .. ".lazy")

-- require("altjoe.core")
-- require("altjoe.lazy")
-- require("altjoe.plugins")
-- autochdir = true

-- local defaultfile = "/home/altjoe/.config/nvim/hello.md"
local defaultfile = "/home/" .. USER .. "/.config/nvim/hello.md"
if vim.fn.expand("%:p") == "" then
	vim.api.nvim_command("e " .. defaultfile)
end

--set hidden

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     callback = function()
--         require("lint").try_lint()
--     end,
-- })

-- open nvim in normal mode
-- vim.api.nvim_command("startinsert")

-- vim.keymap.set("n", "<leader>Pf", function()
--     print("Searching in " .. vim.fn.expand("~/projects/"))
--     builtin.find_files({
--         prompt_title = "Search project files",
--         find_command = { 'fdfind', '--full-path', vim.fn.expand("~/projects/"), '--hidden', '--exclude', '.git', '--exclude', '.cache', '--exclude', '.local', '--exclude', '.npm', '--exclude', '.cargo', '--max-depth', '5' }
--         -- find_command = { 'find', '.', '-type', 'f', '-not', '-path', '*/.git/*'}
--         -- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
--     });
-- end)

-- vim.keymap.set("n", "<leader>Pf", function()
--     local homepath = vim.fn.expand("~")
--     -- set working directory to home
--     builtin.find_files({
--         prompt_title = "Search user files",
--         find_command = { 'fdfind', '--full-path', '/home/altjoe', '--hidden', '--exclude', '.git', '--exclude', '.cache', '--exclude', '.local', '--exclude', '.npm', '--exclude', '.cargo', '--max-depth', '5' }
--         -- find_command = { 'find', '.', '-type', 'f', '-not', '-path', '*/.git/*'}
--         -- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
--     });
-- end)

-- run Neotree close when opening a file
-- vim.api.nvim_command(
-- "autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif")

-- function OpenDefaultFileIfNeeded()
--     local default_file = vim.fn.expand("/home/altjoe/.config/nvim/hello.md")
--     local current_file = vim.fn.expand("%:p")
--
--     if current_file == "" then
--         vim.api.nvim_command("e " .. default_file)
--     end
-- end
--
-- vim.api.create_autocmd("VimEnter", {
--     pattern = "*",
--     callback = OpenDefaultFileIfNeeded,
-- })

-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     callback = OpenDefaultFileIfNeeded,
-- })
