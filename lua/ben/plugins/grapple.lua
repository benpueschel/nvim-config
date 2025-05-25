return {
	'cbochs/grapple.nvim',
	opts = {
		scope = 'git',
		icons = true,
		status = true
	},
	keys = {
		{ '<leader>m', '<cmd>Grapple toggle<cr>', desc = 'Grapple Toggle' },
		{ '<leader>h', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple Tag' },

		{ '<leader>1', '<cmd>Grapple select index=1<cr>', desc = 'Select tag 1' },
		{ '<leader>2', '<cmd>Grapple select index=2<cr>', desc = 'Select tag 2' },
		{ '<leader>3', '<cmd>Grapple select index=3<cr>', desc = 'Select tag 3' },
		{ '<leader>4', '<cmd>Grapple select index=4<cr>', desc = 'Select tag 4' },
		{ '<leader>5', '<cmd>Grapple select index=5<cr>', desc = 'Select tag 5' },
		{ '<leader>6', '<cmd>Grapple select index=6<cr>', desc = 'Select tag 6' },
		{ '<leader>7', '<cmd>Grapple select index=7<cr>', desc = 'Select tag 7' },
		{ '<leader>8', '<cmd>Grapple select index=8<cr>', desc = 'Select tag 8' },
		{ '<leader>9', '<cmd>Grapple select index=9<cr>', desc = 'Select tag 9' },
	},
}
