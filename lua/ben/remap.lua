vim.g.mapleader = ' '

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
