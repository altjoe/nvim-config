-- -- function that will be run on file buffers when they are opened
-- -- this function will change the working directory to the root of the project
-- -- if it can find a .git or .hg directory
-- -- if it can't find a .git or .hg directory it will do nothing
--
-- function CheckIfRoot(path)
-- 	local result = vim.fn.isdirectory(path .. "/.git")
-- 	if result == 1 then
-- 		return true
-- 	end
-- 	-- chechf if config.lua is in the path
-- 	result = vim.fn.filereadable(path .. "/config.lua")
-- 	if result == 1 then
-- 		return true
-- 	end
-- 	return false
-- end
--
-- function GoUp(path)
-- 	return vim.fn.fnamemodify(path, ":h")
-- end
--
-- function AutoRoot()
-- 	-- file path
-- 	print("Running AutoRoot")
-- 	local file_dir = vim.fn.expand("%:p:h")
--
-- 	-- if not a file_dir then return
-- 	print("File directory: " .. file_dir)
--
-- 	while not CheckIfRoot(file_dir) do
-- 		file_dir = GoUp(file_dir)
-- 		if file_dir == "/" then
-- 			print("No root directory found")
--
-- 			return
-- 		end
-- 	end
-- 	-- if working directory is already the root directory
-- 	if file_dir == vim.fn.getcwd() then
-- 		print("Already in root directory")
-- 		return
-- 	end
-- 	vim.cmd("cd " .. file_dir)
-- 	print("Changed directory to " .. file_dir)
-- end
--
function AutoRootDefaultToFilePath()
	-- check if active buffer is a file
	if vim.fn.expand("%:t") == "" then
		print("Not a file")
		return
	end
	-- file path
	local file_dir = vim.fn.expand("%:p:h")

	vim.cmd("cd " .. file_dir)
	print("Changed directory to " .. file_dir)
end

-- keybind for <leader>to use autodefault

function AutoRoot()
	-- if there are no text files in the current directory then it is not a project
	-- we can get the current folders in the directory and if it one of the directories has the current
	-- file then we can set the root to that directory

	-- get the current directory
	print("Running AutoRoot")
	local currentpath = vim.fn.expand("%:p")
	print("Current path: " .. currentpath)
	-- if the current path is a file then get the directory
	if vim.fn.isdirectory(currentpath) == 0 then
		currentpath = vim.fn.fnamemodify(currentpath, ":h")
	end

	local files_and_folders = vim.fn.readdir(currentpath)
	local cwd = vim.fn.getcwd()
	if currentpath == cwd then
		print("Already in root directory: " .. cwd)
		return
	end

	local lookfor = { ".git", "config.lua", ".env" }

	while #files_and_folders ~= 0 do
		files_and_folders = vim.fn.readdir(currentpath)
		print("Looking at " .. currentpath)
		for _, file in ipairs(files_and_folders) do
			local filename = vim.fn.fnamemodify(file, ":t")

			-- if filename in lookfor then set root to currentpath
			for _, look in ipairs(lookfor) do
				if filename == look then
					vim.cmd("cd " .. currentpath)
					print("Changed directory to " .. currentpath)
					return
				end
			end
		end

		if currentpath == "/" then
			print("No root directory found")
			return
		end
		currentpath = vim.fn.fnamemodify(currentpath, ":h")
	end
end

-- keybind for <leader>to use autodefault
vim.keymap.set("n", "<leader>1", function()
	AutoRoot()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dc", function()
	-- set root for current buffer
	AutoRootDefaultToFilePath()
end, { noremap = true, silent = true })
