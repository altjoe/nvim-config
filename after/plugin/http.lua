function GetRequest()
	local treesitterhttpparser = vim.treesitter.get_parser(0, "http")
	local root = treesitterhttpparser:parse()[1]:root()

	local query = vim.treesitter.query.parse(
		"http",
		[[
    (request) @request
  ]]
	)

	local currentcursorpos = vim.api.nvim_win_get_cursor(0)[1]

	local query_matches = query:iter_matches(root, 0)
	for _, match in query:iter_matches(root, 0) do
		for id, node in pairs(match) do
			if query.captures[id] == "request" then
				-- print(node)
				local start = node:start() + 1
				local end_line = node:end_() + 1

				if currentcursorpos >= start and currentcursorpos <= end_line then
					local text = vim.api.nvim_buf_get_lines(0, start - 1, end_line, false)

					local request = table.concat(text, "\n")

					local tmpfile = "/tmp/request.http"
					-- delete file if it exists
					os.remove(tmpfile)
					local f = io.open(tmpfile, "w")
					if f == nil then
						print("Error opening temp file")
						return
					end
					f:write(request)
					f:close()
					-- Function to run a command and return its output
					local function run_command(cmd)
						local handle = io.popen(cmd)
						if not handle then
							return nil, "Error running command: " .. cmd
						end

						local result, err = handle:read("*a")
						handle:close()
						handle = nil
						if err then
							return nil, "Error reading result: " .. err
						end

						return result
					end

					-- Run the first hurl command
					local result, err = run_command("hurl -i " .. tmpfile)
					if err then
						print("Error running hurl command: " .. err)
						return
					end

					if result ~= nil then
						-- vim.notify_once("Results:\n" .. result)
						local resultlen = string.len(result)
						if resultlen ~= 0 then
							vim.api.nvim_command("new")
							local gb = vim.api.nvim_get_current_buf()
							vim.api.nvim_buf_set_lines(gb, 0, -1, false, vim.split(result, "\n"))
							-- vim.api.nvim_set_option_value("filetype", "http", { buf = gb })
							vim.api.nvim_set_current_buf(gb)
							vim.api.nvim_command("setlocal filetype=hurl")
							return
						end
					end
					print("No result from hurl command")
					local testcmd = "hurl --test " .. tmpfile .. " 2>&1"

					local testresult, err = run_command(testcmd)
					print("testrsult", testresult)
					if err then
						print("Error running hurl command: " .. err)
						return
					end

					if testresult == nil then
						print("No test result from hurl command")
						return
					end

					vim.api.nvim_command("new")
					local gb = vim.api.nvim_get_current_buf()
					vim.api.nvim_buf_set_lines(gb, 0, -1, false, vim.split(testresult, "\n"))
					vim.api.nvim_set_current_buf(gb)
					vim.api.nvim_command("setlocal filetype=hurl")
					--

					-- if err then
					-- 	print("Error running hurl command: " .. err)
					-- 	return
					-- end
					--
					-- local testresultlen = string.len(testresult)
					-- vim.notify_once("Test Results:\n" .. testresult)
					--
					--     vim.api.nvim_buf_set_lines(0, 0, -1, false, { testresult })
					-- end
				end
			end
		end
	end
end

vim.keymap.set("n", "<leader>hg", GetRequest, { noremap = true, silent = true })
