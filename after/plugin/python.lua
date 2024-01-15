-- Source the config.lua in the python project directory
function _Source_config_lua()
    print("Sourcing config.lua...")
    -- if already sourced return

    local cwd = vim.fn.getcwd() .. "/config.lua"
    -- if file exists
    if vim.fn.filereadable(cwd) == 0 then
        print("config.lua file does not exist in working directory")
        return
    end

    vim.cmd("source " .. cwd)
    return true
end

-- Split terminal and activate conda for the current project
vim.keymap.set('n', '<Leader>st', function()
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

-- Split terminal horizontally and run the activate python file
vim.keymap.set("n", "<Tab>hrp", function()
    vim.cmd("w")

    _Source_config_lua()

    local pathToPython = vim.g.python3_host_prog or "python3"

    vim.cmd("belowright split | terminal " .. pathToPython .. " %")
end)

-- Split terminal vertically and run the activate python file
vim.keymap.set("n", "<Tab>rp", function()
    vim.cmd("w")

    _Source_config_lua()

    local pathToPython = vim.g.python3_host_prog or "python3"

    vim.cmd("belowright vsplit | terminal " .. pathToPython .. " %")
end)
