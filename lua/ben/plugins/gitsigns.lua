return {
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		config = function()
			require('gitsigns').setup({
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
		end
	},
}
