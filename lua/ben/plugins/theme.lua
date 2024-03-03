return {
	{ 'dracula/vim', event = 'VeryLazy', name = 'dracula' },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			vim.cmd.colorscheme('catppuccin-macchiato')
		end
	}
}
