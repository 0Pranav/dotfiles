local builtin = require('telescope.builtin')
require('telescope').load_extension('projects')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', function() builtin.grep_string({ search = vim.fn.input("Grep >") }) end)
vim.keymap.set('n', '<leader>pp', function () require'telescope'.extensions.projects.projects{} end)

