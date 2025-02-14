--
vim.keymap.set("n", "<leader>so", function()
	-- source current file
	vim.api.nvim_command("source %")
end)
-- restart lsp keybind
vim.keymap.set("n", "<leader>rl", function()
	vim.api.nvim_command("LspRestart")
	print("LSP Restarted")
end)

print("Sourcing remap.lua")
-- This is a function to source the config.lua file in the python project's working directory

vim.g.mapleader = " "

-- Escaping from insert mode with jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Excaping for visual mode with nm
vim.api.nvim_set_keymap("v", "nm", "<Esc>", { noremap = true, silent = true })

-- Escaping from terminal mode with jk
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- Simple quit window
vim.keymap.set("n", "Q", function()
	local buftype = vim.bo.buftype
	print(buftype)
	-- if editable - write and quit
	-- if not editable - just quit

	function writeSave()
		vim.api.nvim_command("wq")
	end

	if buftype == "" then
		if pcall(writeSave) then
			print("Written and Quit")
		else
			local filename = vim.fn.expand("%:t")
			if filename == "" then
				vim.api.nvim_command("q!")
			else
				vim.api.nvim_command("q")
				vim.api.nvim_command("q")
			end
		end
	elseif buftype == "terminal" then
		print("quitting terminal")
		-- start insert mode
		vim.api.nvim_command("startinsert")
		-- send <C-c> to potentially stop any running process
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "i", false)

		-- term codes "<C-\\><C-n>"
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), "n", true)
		vim.api.nvim_command("bd!")
	else --if vim.fn.winnr("$") == 1 or buftype == "dbout" then
		vim.api.nvim_command("q")
	end
end)

-- Simple quit window
-- vim.keymap.set("n", "Q", function()
-- 	-- if buffer is writeable, write and quit
-- 	-- else just quit
-- 	local wincount = vim.fn.winnr("$")
--
-- 	print("Buffer count: ", wincount)
-- 	print("Modifiable: ", vim.bo.modifiable, "buftype: ", vim.bo.buftype, "filetype: ", vim.bo.filetype)
--
-- 	if vim.bo.modifiable then
-- 		print("Modifiable")
-- 		-- if not a terminal buffer
-- 		if vim.bo.buftype == "" then
-- 			local filename = vim.fn.expand("%:t")
-- 			if filename ~= "" then
-- 				vim.api.nvim_command("w")
-- 			end
-- 		end
-- 		if wincount == 1 then
-- 			-- get user input for y or n
-- 			local input = vim.fn.input("Quit? (y/n): ")
-- 			if input == "y" then
-- 				vim.api.nvim_command("q")
-- 			end
-- 		else
-- 			-- print("Buffer count: ", wincount)
--
-- 			vim.api.nvim_command("q")
-- 		end
-- 	elseif vim.bo.filetype == "dbout" then
-- 		if wincount == 1 then
-- 			local input = vim.fn.input("Quit? (y/n): ")
-- 			if input == "y" then
-- 				vim.api.nvim_command("q")
-- 			end
-- 		else
-- 			vim.api.nvim_command("q")
-- 		end
-- 	else
-- 		-- if terminal buffer or preview window
-- 		if vim.bo.buftype == "terminal" then
-- 			local currentbuf = vim.api.nvim_get_current_buf()
-- 			print("quitting terminal")
--
-- 			-- Enter insert mode
-- 			vim.api.nvim_command("startinsert")
--
-- 			-- Send <C-c> to potentially stop any running process
-- 			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "i", false)
--
-- 			-- Function to delay and then quit
-- 			local function delayed_quit()
-- 				vim.defer_fn(function()
-- 					local testcurrentbuf = vim.api.nvim_get_current_buf()
-- 					if currentbuf == testcurrentbuf then
-- 						if wincount == 1 then
-- 							-- get user input for y or n
-- 							local input = vim.fn.input("Quit? (y/n): ")
-- 							if input == "y" then
-- 								print("quitting terminal")
-- 								vim.api.nvim_command("q")
-- 							end
-- 						else
-- 							print("quitting terminal")
-- 							-- print("Buffer count: " .. wincount)
-- 							vim.api.nvim_command("q")
-- 						end
-- 					end
-- 				end, 200) -- Adjust delay as necessary (in milliseconds)
-- 			end
--
-- 			-- Call the delayed_quit function
-- 			delayed_quit()
-- 		else
-- 			-- try to quit
-- 			vim.api.nvim_command("q")
-- 		end
-- 	end
-- end)

-- -- Simple format and save
-- vim.keymap.set("n", "W", function()
-- 	-- if buffer is writeable, write and quit
-- 	if vim.bo.modifiable then
-- 		function format()
-- 			-- the command :Format
--
-- 			vim.api.nvim_command("Format")
--
-- 			-- vim.api.nvim_command("LspZeroFormat")
-- 			vim.api.nvim_command("w")
-- 			print("Written and formatted", os.time())
-- 		end
--
-- 		-- if cant format, just save
-- 		if not pcall(format) then
-- 			vim.api.nvim_command("w")
-- 			print("Written and not formatted", os.time())
-- 		end
-- 	end
-- end)

vim.keymap.set("n", "<M-w>", function()
	-- if buffer is writeable, write and quit
	if vim.bo.modifiable then
		vim.api.nvim_command("w")
		print("Written: ", os.time())
	end
end)

vim.keymap.set("n", "W", function()
	_Source_config_lua()
	vim.api.nvim_command("w")
	print("Written", os.time())
	print(vim.g.onsave)
	if vim.g.onsave then
		print("Running onsave command: ", vim.g.onsave)
		vim.api.nvim_command(vim.g.onsave)
		-- wait a second then enter to close cmd window
		vim.defer_fn(function()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
		end, 1000)
	end
end)

-- Simple escape from terminal mode
vim.keymap.set("t", "<Esc><Esc>", function()
	vim.api.nvim_command("stopinsert")
end, { silent = true })

--find and replace
vim.keymap.set("v", "<leader>hh", function()
	-- Exit visual mode and then execute the rest of the function after a slight delay
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

	-- Delay the execution to ensure the mode has changed
	vim.defer_fn(function()
		-- Get the current buffer number
		local bufnr = vim.api.nvim_get_current_buf()

		-- Get the positions of the start and end of the visual selection
		local start_pos = vim.api.nvim_buf_get_mark(bufnr, "<")
		local end_pos = vim.api.nvim_buf_get_mark(bufnr, ">")

		-- Retrieve the text from the buffer
		local lines =
			vim.api.nvim_buf_get_text(bufnr, start_pos[1] - 1, start_pos[2], end_pos[1] - 1, end_pos[2] + 1, {})

		-- Concatenate lines if necessary and print
		local text = table.concat(lines, "\n")

		vim.cmd("/" .. text)
		vim.defer_fn(function()
			local replace = vim.fn.input("Replace: ", text)
			vim.api.nvim_command(":%s/" .. text .. "/" .. replace .. "/g")
		end, 10) -- 10ms delay
	end, 10) -- 10ms delay
end)

-- annoying keys that i hit so remap to nothing
vim.api.nvim_set_keymap("n", "L", "", { noremap = true })

-- enable highlighting
vim.api.nvim_set_keymap("n", "<leader>h", ":TSEnable highlight<CR>", { noremap = true, silent = true })

-- quick on wg vpn
-- run the shell command in a new terminal to "sudo wg-quick up home"
vim.keymap.set("n", "<leader>dvpn", function()
	-- open a new terminal split to the left and run the command
	vim.cmd("rightbelow vsplit | terminal sudo wg-quick down home")
	-- go into insert mode
	vim.cmd("startinsert")
end, { noremap = true, silent = true })

-- quick on wg vpn
-- run the shell command in a new terminal to "sudo wg-quick up home"
vim.keymap.set("n", "<leader>vpn", function()
	-- open a new terminal split to the left and run the command
	vim.cmd("rightbelow vsplit | terminal sudo wg-quick up home")
	-- go into insert mode
	vim.cmd("startinsert")
end, { noremap = true, silent = true })

-- use the keyboard shortcut <leader>cp to copy the current file path to the clipboard
vim.keymap.set("n", "<leader>cp", function()
	-- get the current file path
	local file_path = vim.fn.expand("%:p")
	-- copy the file path to the clipboard
	vim.fn.setreg("+", file_path)
	-- print the file path
	print("Copied to clipboard: " .. file_path)
end, { noremap = true, silent = true })

-- select word under cursor in visual mode
vim.keymap.set("n", "<leader>hw", function()
	-- if the cursor is not on the first letter of the word
	-- use the shortcut b to move to the beginning of the word
	if vim.fn.col(".") > 1 then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("b", true, false, true), "n", true)
	end

	-- use the shortcut v to enter visual mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("v", true, false, true), "n", true)
	-- the shortcut e to move to the end of the word
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("e", true, false, true), "n", true)
end, { noremap = true, silent = true })

-- keymap for leader nr and leader na for setting number relative and number absolute
vim.keymap.set("n", "<leader>nr", ":set relativenumber!<CR>", { noremap = true, silent = true })

-- leader based window splite vertical and horizontal leader wv and leader wh
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true })

-- keymap to add the current working directory structure to the clipboard using the tree cli
vim.keymap.set("n", "<leader>yt", function()
	-- get the current working directory
	local cwd = vim.fn.getcwd()
	-- run the tree command to get the directory structure
	local tree = vim.fn.systemlist("tree " .. cwd)
	-- convert the tree to a string
	local tree_str = table.concat(tree, "\n")
	-- copy the tree to the clipboard
	vim.fn.setreg("+", tree_str)
	-- print the tree
	print("Copied tree to clipboard :)")
end, { noremap = true, silent = true })
