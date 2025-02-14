-- --vim.api.nvim_create_autocmd({"BufEnter", "FileType" }, t local mark = require("harpoon.mark")
-- -- local ui = require("harpoon.ui")
-- --
-- -- vim.keymap.set("n", "<leader>a", mark.add_file)
-- -- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
-- --
-- -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- -- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- -- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- -- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
--
-- local harpoon = require("harpoon").setup({
-- 	global_settings = {
-- 		save_on_toggle = true,
-- 		save_on_change = true,
-- 		-- save_path = vim.fn.getcwd() .. "/.harpoon_marks",
-- 	},
-- })
-- -- REQUIRED
--
-- vim.keymap.set("n", "<leader>a", function()
-- 	harpoon:list():add()
-- end)
-- vim.keymap.set("n", "<C-e>", function()
-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
--
-- vim.keymap.set("n", "<C-u>", function()
-- 	harpoon:list():select(1)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-p>", function()
-- 	harpoon:list():select(2)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-n>", function()
-- 	harpoon:list():select(3)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-m>", function()
-- 	harpoon:list():select(4)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-M-u>", function()
-- 	harpoon:list():select(5)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-M-p>", function()
-- 	harpoon:list():select(6)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-M-n>", function()
-- 	harpoon:list():select(7)
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-M-m>", function()
-- 	harpoon:list():select(8)
-- end, { noremap = true, silent = true })
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function()
-- 	harpoon:list():prev()
-- end)
-- vim.keymap.set("n", "<C-S-N>", function()
-- 	harpoon:list():next()
-- end)
--
-- require("telescope").load_extension("harpoon")
--
--

local harpoon = require("harpoon")
harpoon:setup({})

local harpoon = require("harpoon").setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
		-- save_path = vim.fn.getcwd() .. "/.harpoon_marks",
	},
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-u>", function()
	harpoon:list():select(1)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", function()
	harpoon:list():select(2)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-m>", function()
	harpoon:list():select(4)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-u>", function()
	harpoon:list():select(5)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-p>", function()
	harpoon:list():select(6)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-n>", function()
	harpoon:list():select(7)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-m>", function()
	harpoon:list():select(8)
end, { noremap = true, silent = true })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
