local user = os.getenv("USER")
print("Hello " .. user)


require("altjoe.core")
require("altjoe.lazy")



function OpenDefaultFileIfNeeded()
    local default_file = vim.fn.expand("/home/altjoe/.config/nvim/hello.md")
    local current_file = vim.fn.expand("%:p")

    if current_file == "" then
        vim.api.nvim_command("e " .. default_file)
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = OpenDefaultFileIfNeeded,
})


function ChangeToProjectDirectory()
    local current_path = vim.fn.expand("%:p")
    vim.api.nvim_command("lcd " .. current_path)

    while vim.fn.isdirectory(vim.fn.getcwd() .. "/.git") == 0 and vim.fn.getcwd() ~= "/" do
        vim.api.nvim_command("lcd ..")
    end
end

-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "*",
--     callback = ChangeToProjectDirectory,
-- })
