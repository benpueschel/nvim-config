local plugins = {
	
	{ 'rstacruz/vim-closer' },

	{ 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = 'nvim-lua/plenary.nvim' },
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	{ 'nvim-lualine/lualine.nvim', requires = 'nvim-tree/nvim-web-devicons' },
	{ 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' },

	{ 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' },


	{ 'mfussenegger/nvim-dap' },
	{ 'theHamsta/nvim-dap-virtual-text' },

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },             -- Required
			{                                        -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			{ 'p00f/clangd_extensions.nvim' },     -- Optional
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

}

return plugins
