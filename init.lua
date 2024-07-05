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
--

vim.opt.shell = "/usr/bin/fish"
-- local user = os.getenv("USER")
-- print("Hello " .. user)
USER = vim.fn.expand("$USER")
print("Hello " .. USER)
require(USER .. ".core")
require(USER .. ".lazy")

vim.deprecate = function() end
--  set splitright
vim.opt.splitright = true

-- fold level 99
vim.opt.foldlevel = 99
