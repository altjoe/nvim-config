local M = {}

local util = require("formatter.util")

function M.templ_fmt()
	return {
		exe = "templ fmt",
		stdin = true,
	}
end

return M
