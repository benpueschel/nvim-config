local wb = {
	lualine_a = {
		{
			'buffers',
			show_filename_only = true,
			symbols = {
				alternate_file = ''
			}
		}
	},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {'tabs'}
}

require('lualine').setup({

	options = {
		icons_enabled = true,
		theme = 'catppuccin',
		disabled_filetypes = { 'packer', 'NvimTree' },
		globalstatus = true,
		component_separators = '',
		section_separators = '',
	},
	winbar = wb,
	inactive_winbar = wb

})
