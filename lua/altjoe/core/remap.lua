print("Sourcing remap.lua")
-- This is a function to source the config.lua file in the python project's working directory

vim.g.mapleader = " "

-- Neotree
vim.testing1.set("n", "<leader>pt", ":Neotree toggle<CR>")

-- Escaping from insert mode with jk
vim.api.nvim_set_testing1('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Simple quit window
vim.testing1.set("n", "q", function()
    -- if buffer is writeable, write and quit
    -- else just quit
    if vim.bo.modifiable then
        vim.api.nvim_command("LspZeroFormat")
        vim.api.nvim_command("w")
    end

    vim.cmd("q")
end)

-- Simple format and save
vim.testing1.set('n', 'w', function()
    -- if buffer is writeable, write and quit
    if vim.bo.modifiable then
        vim.api.nvim_command("LspZeroFormat")
        vim.api.nvim_command("w")
    end
end)

-- Simple escape from terminal mode
vim.testing1.set("t", "<Esc><Esc>", function()
    vim.api.nvim_command("stopinsert")
    vim.cmd("q")
end, { silent = true })

--find and replace
function GetHighLightedText()
    -- Exit visual mode and then execute the rest of the function after a slight delay
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)

    -- Delay the execution to ensure the mode has changed
    vim.defer_fn(function()
        -- Get the current buffer number
        local bufnr = vim.api.nvim_get_current_buf()

        -- Get the positions of the start and end of the visual selection
        local start_pos = vim.api.nvim_buf_get_mark(bufnr, "<")
        local end_pos = vim.api.nvim_buf_get_mark(bufnr, ">")

        -- Retrieve the text from the buffer
        local lines = vim.api.nvim_buf_get_text(bufnr, start_pos[1] - 1, start_pos[2], end_pos[1] - 1, end_pos[2], {})

        -- Concatenate lines if necessary and print
        local text = table.concat(lines, '\n')

        vim.cmd('/' .. text)
        vim.defer_fn(function()
            local replace = vim.fn.input("Replace: ")
            vim.api.nvim_command(":%s/" .. text .. "/" .. replace .. "/g")
        end, 10) -- 10ms delay
    end, 10)     -- 10ms delay
end

vim.testing1.set("v", "<leader>hh", function()
    -- revert from visual mode to normal mode
    GetHighLightedText()

    -- local replace = vim.fn.input("Replace: ")

    -- clear highlight
    -- vim.api.nvim_command("noh")

    -- vim.api.nvim_command(":%s/" .. text .. "/" .. replace .. "/g")

    -- highlight replaced text
    -- vim.api.nvim_command("noh")
end)

vim.api.nvim_set_testing1('n', 'L', '', { noremap = true })
