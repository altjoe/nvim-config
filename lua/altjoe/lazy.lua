print("Loading lazy config...")
USER = vim.fn.expand("$USER")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(USER .. ".plugins")
local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
    treesitter.setup({
        ensure_installed = { "typescript", "css", "javascript", "svelte" },
        highlight = { enable = true },
    })
end
