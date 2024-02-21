local telescope = require("telescope")


-- Neotree
vim.keymap.set("n", "<leader>pt", 
    function()
        -- run the comman 'RooterToggle' to change the working directory to the root of the project
        -- vim.api.nvim_command("RooterToggle")

        -- if the current buffer is a file use the Neotree reveal command
        if vim.api.nvim_buf_get_option(0, "buftype") == "" then
            vim.api.nvim_command("Neotree reveal float")
        else
            -- if the current buffer is not a file use the Neotree toggle command
            vim.api.nvim_command("Neotree toggle float")
        end
    end, { noremap = true, silent = true })
