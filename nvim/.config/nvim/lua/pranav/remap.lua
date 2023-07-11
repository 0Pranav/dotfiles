vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", require("oil").open, { desc = "Open parent directory" })
-- make sure the cursor stays in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
