require("nvterm").setup({
    terminals = {
        type_opts = {
            vertical = { split_ratio = 0.2 }
        }
    },
    behavior = {
        autoclose_on_quit = {
            enabled = true,
            confirm = false,
        },
    }
})

vim.keymap.set("n", "<leader>th", function() require("nvterm.terminal").toggle('horizontal') end, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>tv", function() require("nvterm.terminal").toggle('vertical') end, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>tf", function() require("nvterm.terminal").toggle('float') end, { desc = "Open parent directory" })
