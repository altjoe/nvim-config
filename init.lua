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

-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     callback = OpenDefaultFileIfNeeded,
-- })
