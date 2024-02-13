-- function that will be run on file buffers when they are opened
-- this function will change the working directory to the root of the project
-- if it can find a .git or .hg directory
-- if it can't find a .git or .hg directory it will do nothing

function CheckIfRoot(path)
    local result = vim.fn.isdirectory(path .. '/.git')
    if result == 1 then
        return true
    end
    return false
end

function GoUp(path)
    return vim.fn.fnamemodify(path, ':h')
end

function AutoRoot()
    -- file path
    local file_dir = vim.fn.expand('%:p:h')

    while not CheckIfRoot(file_dir) do
        file_dir = GoUp(file_dir)
        if file_dir == '/' then
            print('No root directory found')
            return
        end
    end

    vim.cmd('cd ' .. file_dir)
    print('Changed directory to ' .. file_dir)
end

-- run autocmd on file open and don't require usig the return key
