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
