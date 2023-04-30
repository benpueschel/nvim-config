local wb = {

	lualine_a = {
		{
			'buffers',
			show_filename_only = false
		}
	},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {'tabs'},

}

require('lualine').setup({

	options = {
		icons_enabled = true,
		theme = 'dracula',
		disabled_filetypes = { 'packer', 'NvimTree', 'CMake' },
		globalstatus = true
	},
	winbar = wb,
	inactive_winbar = wb

})
