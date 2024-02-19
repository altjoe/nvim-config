function openFileExplorer()
    local isWindows = vim.loop.os_uname().sysname == "Windows"
    local openCmd = isWindows and "start" or "xdg-open"
    local dir = vim.fn.expand("%:p:h")
    vim.fn.system(string.format("%s %s", openCmd, dir))
end

vim.keymap.set("n", "<leader>fe", openFileExplorer, { noremap = true, silent = true })
