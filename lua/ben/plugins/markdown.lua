return {
	{
		'MeanderingProgrammer/markdown.nvim',
		ft = { 'markdown' },
		opts = {
			code = {
				style = "language",
			}
		},
	},
	{
		'epwalsh/obsidian.nvim',
		version = "*",
		ft = { 'markdown' },
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
		},
		init = function()
			vim.cmd ":set conceallevel=0"
		end,
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/vaults/personal",
				}
			},
			daily_notes = {
				folder = "daily",
				date_format = "%Y-%m-%d",
				alias_format = "%B %-d, %Y",
				default_tags = { "daily" },
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			}
		},
	}
}
