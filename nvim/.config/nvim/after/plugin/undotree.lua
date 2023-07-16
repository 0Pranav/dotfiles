--- vim.keymap.set('n', '<leader>u', require('undotree').toggle, {noremap = true, silent = true})

local wk = require("which-key")

wk.register({
    u = { function() require("undotree").toggle() end, "Undotree" }
}, { prefix = "<leader>" })
