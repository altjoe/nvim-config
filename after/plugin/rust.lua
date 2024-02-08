
-- Split terminal vertically and run the activate rust file
vim.keymap.set("n", "<Tab>rr", function()
    vim.cmd("w")

    _Source_config_lua()


    vim.cmd("belowright vsplit | terminal " .. "cargo run")
end)
