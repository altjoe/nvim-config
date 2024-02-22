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
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<leader>puf", function()
	-- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
	local userdir = "/home/altjoe"
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
