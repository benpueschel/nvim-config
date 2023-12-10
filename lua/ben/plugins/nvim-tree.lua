return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = 'nvim-tree/nvim-web-devicons',
		lazy = true,
		init = function()
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true

			-- empty setup using defaults
			require("nvim-tree").setup({
				view = {
					relativenumber = true,
					width = 40,
					preserve_window_proportions = true,
				},
				renderer = {
					indent_markers = {
						enable = true
					}
				},
			})
		end
	},
}
