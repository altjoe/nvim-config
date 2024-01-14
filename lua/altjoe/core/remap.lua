print("Loading remap config...")


vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pt", ":Neotree toggle<CR>") 
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pr', ':vsplit | wincmd L | terminal python3 %<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap ('n', '<leader>w', ':q<CR>', { noremap = true, silent = true })
