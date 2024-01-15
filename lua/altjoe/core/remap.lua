print("Loading remap config...")
-- This is a function to source the config.lua file in the python project's working directory

vim.g.mapleader = " "

-- Neotree
vim.keymap.set("n", "<leader>pt", ":Neotree toggle<CR>")

-- Escaping from insert mode with jk
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Simple quit window
vim.keymap.set("n", "q", function()
    -- if buffer is writeable, write and quit
    -- else just quit
    if vim.bo.modifiable then
        vim.api.nvim_command("LspZeroFormat")
        vim.api.nvim_command("w")
    end

    vim.cmd("q")
end)

-- Simple format and save
vim.keymap.set('n', 'w', function()
    -- if buffer is writeable, write and quit
    if vim.bo.modifiable then
        vim.api.nvim_command("LspZeroFormat")
        vim.api.nvim_command("w")
    end
end)

-- Simple escape from terminal mode
vim.keymap.set("t", "<Esc><Esc>", function()
    vim.api.nvim_command("stopinsert")
    vim.cmd("q")
end, { silent = true })
