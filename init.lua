local user = os.getenv("USER")
print("Hello " .. user)

require("altjoe.core")
require("altjoe.lazy")


vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "Neotree toggle"
})



