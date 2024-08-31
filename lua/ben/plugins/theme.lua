return {
	{ 'dracula/vim', event = 'VeryLazy', name = 'dracula' },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			require('catppuccin').setup({
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				transparent_background = true,
			})

			vim.cmd.colorscheme('catppuccin-macchiato')
			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
		end
	}
}
