local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>puf", function()
    builtin.find_files({
        prompt_title = "Search user files",
        cwd = vim.fn.expand("~"),
        hidden = true,
        find_command = { 'find', '.', '-type', 'f', '-not', '-path', '*/.git/*', '-maxdepth', '5' },
        -- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },
    });
end)

vim.keymap.set("n", "<leader>prf", function()
    builtin.find_files({
        prompt_title = "Search root files",
        cwd = "/",
        hidden = true,
        find_command = { 'find', '.', '-type', 'f', '-not', '-path', '*/.git/*', '-maxdepth', '5' },
        -- find_command = { 'find', '/', '-type', 'f', '-not', '-path', '*/\\.*', '-maxdepth', '3' },

    });
end)
