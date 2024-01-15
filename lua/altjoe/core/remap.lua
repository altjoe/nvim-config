print("Loading remap config...")

function _Source_config_lua()
    print("Sourcing config.lua...")

    local cwd = vim.fn.getcwd() .. "/config.lua"
    -- if file exists
    if vim.fn.filereadable(cwd) == 0 then
        print("config.lua file does not exist in working directory")
        return
    end

    vim.cmd("source " .. cwd)
    return true
end

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pt", ":Neotree toggle<CR>")
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "q", function()
    vim.cmd("q")
end)

vim.keymap.set('n', 'w', -- ':w<CR> | :LspZeroFormat', { noremap = true, silent = true })
    function()
        vim.api.nvim_command("LspZeroFormat")
        vim.api.nvim_command("w")
    end)

-- vim.api.nvim_set_keymap('n', '<leader>st', "", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>st', function()
    vim.cmd("rightbelow vsplit | terminal")
    vim.cmd("startinsert")

    local sourced = _Source_config_lua()

    -- if CONDA_NAME is not nil
    if vim.env.CONDA_NAME ~= nil then
        print("Conda environment detected: " .. vim.env.CONDA_NAME)
        local conda = "conda activate " .. vim.env.CONDA_NAME .. "<CR>"
        vim.api.nvim_input(conda)
    else
        vim.env.CONDA_NAME = "base"
        print("Conda environment not detected, using base")
    end


    -- get working directory
    local cwd = "cd " .. vim.fn.getcwd() .. "<CR>"
    vim.api.nvim_input(cwd)
end)

vim.keymap.set("n", "<Tab>hrp", function()
    vim.cmd("w")

    _Source_config_lua()

    local pathToPython = vim.g.python3_host_prog or "python3"

    vim.cmd("belowright split | terminal " .. pathToPython .. " %")
end)


vim.keymap.set("n", "<Tab>rp", function()
    vim.cmd("w")

    _Source_config_lua()

    local pathToPython = vim.g.python3_host_prog or "python3"

    vim.cmd("belowright vsplit | terminal " .. pathToPython .. " %")
end)

vim.keymap.set("t", "<Esc><Esc>", function()
    vim.api.nvim_command("stopinsert")
    vim.cmd("q")
end, { silent = true })
