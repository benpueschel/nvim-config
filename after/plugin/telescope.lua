local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({
	defaults = {
		prompt_prefix = '   ',
		selection_caret = '  ',
		entry_prefix = '  ',
		initial_mode = 'insert'
	},
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

