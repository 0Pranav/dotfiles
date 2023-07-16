vim.g.mapleader = " "
local wk = require("which-key")

wk.register({
    p = {
        name = "projects",
        v = { function()
            require("oil").open()
        end, "Open parent directory" },
    }
})

-- make sure the cursor stays in the middle of the screen when jumping half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
