local builtin = require('telescope.builtin')
require('telescope').load_extension('projects')

--- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--- vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
--- vim.keymap.set('n', '<leader>ff', function() builtin.grep_string({ search = vim.fn.input("Grep >") }) end)
--- vim.keymap.set('n', '<leader>pp', function () require'telescope'.extensions.projects.projects{} end)
local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files"}, -- additional options for creating the keymap
    g = { "<cmd>Telescope git_files<cr>", "Open Git Files"}, -- additional options for creating the keymap
    G = { "<cmd>Telescope grep_string<cr>", "Search for word"}, -- additional options for creating the keymap
  },
  p = {
      name="projects",
      p = {"<cmd>Telescope projects<cr>", "Search projects"}
  }
}, { prefix = "<leader>" })

