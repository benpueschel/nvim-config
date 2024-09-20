return {
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		config = function()
			local gitsigns = require('gitsigns')
			gitsigns.setup({
				signcolumn = true,
				current_line_blame = true,
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				}
			})
			vim.keymap.set({ 'n', 'v' }, '<leader>gs', ":Gitsigns stage_hunk<CR>", {})
		end
	},
}
