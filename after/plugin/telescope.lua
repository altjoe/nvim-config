local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", function()
	local currentworkingdir = vim.fn.getcwd()

	builtin.find_files({
		prompt_title = "Search files",
		find_command = { "fdfind", "--full-path", currentworkingdir, "--type", "f" },
		-- find_command = { 'fdfind', '--full-path', current_file_path_parent, 'hidden', '--exclude', '.git', '--exclude', '.cache', '--exclude', '.local', '--exclude', '.npm', '--exclude', '.cargo', '--max-depth', '5' }
		-- find_command = { 'find', '.use_libuv_file_watcher', '-type', 'f', '-not', '-path', '*/.git/*'}
		-- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
	})
end)
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	-- builtin.grep_string({ search = vim.fn.input("Grep > ") })
	local currentworkingdir = vim.fn.getcwd()

	builtin.live_grep({
		prompt_title = "Search files",
		find_command = { "rg", "--full-path", currentworkingdir, "--type", "f" },
		-- find_command = { 'fdfind', '--full-path', current_file_path_parent, 'hidden', '--exclude', '.git', '--exclude', '.cache', '--exclude', '.local', '--exclude', '.npm', '--exclude', '.cargo', '--max-depth', '5' }
		-- find_command = { 'find', '.use_libuv_file_watcher', '-type', 'f', '-not', '-path', '*/.git/*'}
		-- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
	})
end)
-- remap select to <CR>
-- when in a quickfix window, <CR> will open the file in the quickfix window
-- with :cc <cursorline>
-- vim.keymap.set("n", "<CR>", function()
-- 	windowtype = vim.fn.getwinvar(0, "&filetype")
-- 	if windowtype == "qf" then
-- 		local cursorline = vim.fn.line(".")
-- 		vim.cmd("cc " .. cursorline)
-- 		-- move cursor to the quickfix window
-- 		vim.cmd("wincmd p")
-- 	else
-- 		builtin.select_default()
-- 	end
-- 	print("windowtype", windowtype)
-- end)

-- search devdocs

-- vim.keymap.set("n", "<leader>pdd", function()
-- 	local devdocsdir = "/home/" .. USER .. "/.local/share/nvim/devdocs/docs"
-- 	local currentFileType = vim.bo.filetype
-- 	for _, dir in ipairs(vim.fn.globpath(devdocsdir, "*", false, 1)) do
-- 		-- if the current file type is in the devdocs directory string
-- 		print("dir", dir)
-- 		if string.find(dir, currentFileType) then
-- 			--
-- 			-- local dirtosearch = devdocsdir .. "/" .. currentFileType
-- 			print("found", dir)
-- 			builtin.live_grep({
-- 				prompt_title = "Search files",
-- 				cwd = dir,
-- 				-- find_command = { "rg", "--full-path", dir, "--type", "f" },
-- 				find_command = { "rg", "--files", "--hidden", "--ignore-case", "--glob", "!.git" },
-- 			})
-- 			return
-- 		end
-- 	end
-- end)

vim.keymap.set("n", "<leader>puf", function()
	-- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
	local userdir = "/home/" .. USER
	builtin.find_files({
		prompt_title = "Search files",
		find_command = {
			"fdfind",
			".",
			userdir,
			"--hidden",
			"--exclude",
			".git",
			"--exclude",
			".cache",
			"--exclude",
			".local",
			"--exclude",
			".npm",
			"--exclude",
			".cargo",
			"--max-depth",
			"5",
			"--type",
			"f",
		},
		-- find_command = { 'fdfind', '--full-path', userdir, '--hidden', '--exclude', '.git', '--exclude', '.cache', '--exclude', '.local', '--exclude', '.npm', '--exclude', '.cargo', '--max-depth', '5' }
	})
end)

vim.keymap.set("n", "<leader>prf", function()
	builtin.find_files({
		prompt_title = "Search root files",
		cwd = "/",
		hidden = true,
		find_command = {
			"fdfind",
			"--full-path",
			"/",
			"--hidden",
			"--exclude",
			".*",
			"--max-depth",
			"3",
			"--type",
			"f",
		},
		-- find_command = { 'find', '.', '-type', 'f', '-not', '-path', '*/.git/*'}
		-- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
	})
end)

vim.keymap.set("n", "tf", function()
	local cwd = vim.fn.getcwd()
	local clipboard = vim.fn.getreg("+")

	builtin.grep_string({
		prompt_title = "Grep clipboard",
		find_command = { "rg", "--full-path", cwd, "--type", "f" },
		-- find_command = { 'fdfind', '--full-path', current_file_path_parent, 'hidden', '--exclude', '.git', '--exclude', '.cache', '--exclude', '.local', '--exclude', '.npm', '--exclude', '.cargo', '--max-depth', '5' }
		-- find_command = { 'find', '.use_libuv_file_watcher', '-type', 'f', '-not', '-path', '*/.git/*'}
		-- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
		default_text = clipboard,
	})
end)
