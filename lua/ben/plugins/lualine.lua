return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		event = 'VeryLazy',
		config = function()
			require('lualine').setup({

				options = {
					globalstatus = true,
					icons_enabled = true,
					theme = 'catppuccin',
					component_separators = '',
					section_separators = '',
				},
				winbar = nil,
				inactive_winbar = nil,
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = {
						{
							'filename',
							file_status = true,
							path = 1,
							shorting_target = 40,
						},
					},
				},

			})
		end
	},
}
