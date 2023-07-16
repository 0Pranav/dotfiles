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

local wk = require("which-key")

wk.register({
    t = {
        name= "terminal",
        h = { function() require("nvterm.terminal").toggle('horizontal') end ,"Horizontal Terminal"},
        v = { function() require("nvterm.terminal").toggle('vertical') end ,"Vertical Terminal"},
        f = { function() require("nvterm.terminal").toggle('float') end ,"Floating Terminal"},
    }
}, { prefix = "<leader>" })
