return {
	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			local builtin = require('telescope.builtin')
			local telescope = require('telescope')

			telescope.setup({
				defaults = {
					prompt_prefix = '   ',
					selection_caret = '  ',
					entry_prefix = '  ',
					initial_mode = 'insert'
				},
				pickers = {
					find_files = {
						-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
					diagnostics = {
						 sort_by = 'severity',
					},
				},
			})

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>mp', builtin.man_pages, {})

			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {})
		end
	},
}
