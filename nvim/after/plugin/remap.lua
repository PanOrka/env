vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>ex', vim.cmd.Ex)

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_files, {})
vim.keymap.set('n', '<C-f>', function()
    telescope_builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

