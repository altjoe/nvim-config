function json_to_go()
	local currentfile = vim.api.nvim_buf_get_name(0)
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")
	if filetype ~= "json" then
		print("Not a json file")
		return
	end
	local structurename = vim.fn.input("Go struct name: ")
	local packagename = vim.fn.input("Go package name: ")

	local cmd = "cat " .. currentfile .. " | gojson"
	if structurename ~= "" then
		cmd = cmd .. " -name " .. structurename
	end

	if packagename ~= "" then
		cmd = cmd .. " -pkg " .. packagename
	end

	local output = vim.fn.system(cmd)

	std_output_to_file(output, structurename .. ".go")
end

function Is_url(str)
	local pattern = "^(http[s]?://[%w-_%.%?%.:/%+=&]+)$"
	return str:match(pattern) ~= nil
end

function std_output_to_file(output, filename)
	pcall(function()
		vim.fn.delete(filename)
	end)

	vim.cmd("vnew " .. filename)
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.split(output, "\n"))
end

function Url_to_go()
	local currentfiledir = vim.fn.expand("%:p:h")

	local highlightedurl = vim.fn.getreg("0")
	if not Is_url(highlightedurl) then
		print("please copy a url to register 0")
		return
	end
	print("highlightedurl: " .. highlightedurl)

	-- get response in temp file
	local tempfilename = "GENERATED_RESPONSE.go"
	local cmd = 'curl -s "' .. highlightedurl .. '" | gojson -pkg main -name Response'

	local output = vim.fn.system(cmd)

	std_output_to_file(output, currentfiledir .. "/" .. tempfilename)
end
--"https://api.kraken.com/0/public/OHLC?pair=BTCUSD&interval=1"
vim.keymap.set("n", "2g", json_to_go, { noremap = true, silent = true })
vim.keymap.set("n", "u2g", Url_to_go, { noremap = true, silent = true })
