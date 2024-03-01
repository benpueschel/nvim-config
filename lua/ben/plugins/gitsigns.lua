return {
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		init = function()
			require('gitsigns').setup({
				signs = {
					add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
					change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
					delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
					topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
					changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
					untracked = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				}
			})
		end
	},
}
