-- keymap for leader db to open a database connection with dadbod
vim.keymap.set("n", "<leader>db", function()
    -- run :DBUIToggle to open a database connection
    vim.api.nvim_command("DBUIToggle")
end, { noremap = true, silent = true })

