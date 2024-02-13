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
    -- run RooterToggle
    -- vim.cmd("RooterToggle")
    vim.cmd("rightbelow vsplit | terminal")
    vim.cmd("startinsert")

    _Source_config_lua()

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

--pytest hotkey
--split to new terminal and run pytest
vim.keymap.set("n", "<leader>tp", function()
    vim.cmd("w")

    _Source_config_lua()

    local pathToPython = vim.g.python3_host_prog or "python3"

    vim.cmd("belowright vsplit | terminal " .. pathToPython .. " -m pytest")
end)



--pytest hotkey
--split to new terminal and run pytest
vim.keymap.set("n", "<leader>tip", function()
    vim.cmd("w")

    _Source_config_lua()

    local pathToPython = vim.g.python3_host_prog or "python3"

    -- get current path
    local path = vim.fn.expand("%:p:h")
    -- get current file name
    local name = vim.fn.expand("%:t")
    local test = ""
    -- if test not in name add it then run pytest
    if not string.find(name, "_test") then
        -- use test file to run pytest
        name = name:gsub(".py", "")
        test = path .. "/" .. name .. "_test.py"
        -- else run pytest
    else
        test = path .. "/" .. name
    end
    print(test)

    vim.cmd("belowright vsplit | terminal " .. pathToPython .. " -m pytest " .. test)

    -- vim.cmd("belowright vsplit | terminal " .. pathToPython .. " -m pytest")
end)
