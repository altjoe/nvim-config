print("Sourcing remap.lua")
-- This is a function to source the config.lua file in the python project's working directory

vim.g.mapleader = " "

-- Escaping from insert mode with jk
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Simple quit window
vim.keymap.set("n", "q", function()
    -- if buffer is writeable, write and quit
    -- else just quit
    if vim.bo.modifiable then
        -- if not a terminal buffer
        if vim.bo.buftype == "" then
            local filename = vim.fn.expand("%:t")
            if filename ~= "" then
                vim.api.nvim_command("w")
            end
        end
    end

    vim.api.nvim_command("q")
end)

-- Simple format and save
vim.keymap.set('n', '<leader>W', function()
    -- if buffer is writeable, write and quit
    if vim.bo.modifiable then
        function format()
            vim.api.nvim_command("LspZeroFormat")
            vim.api.nvim_command("w")
        end

        local status, err = pcall(format)
        if not status then
            -- print "writing without formatting"
            vim.api.nvim_command("w")
            print("writing without formatting")
        end
    end
end)

-- Simple escape from terminal mode
vim.keymap.set("t", "<Esc><Esc>", function()
    vim.api.nvim_command("stopinsert")
end, { silent = true })

--find and replace
vim.keymap.set("v", "<leader>hh", function()
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
        local lines = vim.api.nvim_buf_get_text(bufnr, start_pos[1] - 1, start_pos[2], end_pos[1] - 1, end_pos[2] + 1, {})

        -- Concatenate lines if necessary and print
        local text = table.concat(lines, '\n')

        vim.cmd('/' .. text)
        vim.defer_fn(function()
            local replace = vim.fn.input("Replace: ")
            if replace == "" then
                return
            end
            vim.api.nvim_command(":%s/" .. text .. "/" .. replace .. "/g")
        end, 10) -- 10ms delay
    end, 10)     -- 10ms delay
end)

-- restart copilot service
vim.keymap.set("n", "<leader>co", ':Copilot! toggle<CR>', { silent = true })

-- annoying keys that i hit so remap to nothing
vim.api.nvim_set_keymap('n', 'L', '', { noremap = true })


-- enable highlighting
vim.api.nvim_set_keymap('n', '<leader>h', ':TSEnable highlight<CR>', { noremap = true, silent = true })


-- quick on wg vpn
-- run the shell command in a new terminal to "sudo wg-quick up home"
vim.keymap.set('n', '<leader>vpn', function()
    -- open a new terminal split to the left and run the command
    vim.cmd("rightbelow vsplit | terminal sudo wg-quick up home")
    -- go into insert mode
    vim.cmd("startinsert")
end, { noremap = true, silent = true })


-- use the keyboard shortcut <leader>cp to copy the current file path to the clipboard
vim.keymap.set('n', '<leader>cp', function()
    -- get the current file path
    local file_path = vim.fn.expand("%:p")
    -- copy the file path to the clipboard
    vim.fn.setreg("+", file_path)
    -- print the file path
    print("Copied to clipboard: " .. file_path)
end, { noremap = true, silent = true })
<<<<<<< HEAD
=======

-- select word under cursor in visual mode
vim.keymap.set('n', '<leader>hw', function()
    -- if the cursor is not on the first letter of the word
    -- use the shortcut b to move to the beginning of the word
    if vim.fn.col('.') > 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('b', true, false, true), 'n', true)
    end

    -- use the shortcut v to enter visual mode
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('v', true, false, true), 'n', true)
    -- the shortcut e to move to the end of the word
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('e', true, false, true), 'n', true)
end, { noremap = true, silent = true })
>>>>>>> ea11b8e (working)
