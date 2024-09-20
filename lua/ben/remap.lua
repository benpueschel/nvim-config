vim.g.mapleader = ' '

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<C-n>', vim.cmd.bnext)
vim.keymap.set('n', '<C-m>', vim.cmd.bprev)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>w', vim.cmd.w)
vim.keymap.set('n', '<leader>d', ':bp|bd#<CR>') -- Move to previous buffer and delete the last one
vim.keymap.set('x', '<leader>p', '"_dP')        -- Paste without copying current selection

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- center cursor on search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
