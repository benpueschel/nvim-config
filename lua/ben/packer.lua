-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'rstacruz/vim-closer'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	for _, v in ipairs(require('ben.themes')) do
		use(v)
	end

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-treesitter/playground'

	use {
		'nvim-lualine/lualine.nvim',
		requires = 'nvim-tree/nvim-web-devicons'
	}

	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = 'nvim-tree/nvim-web-devicons'
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}
	use 'p00f/clangd_extensions.nvim'

	use 'mfussenegger/nvim-dap'
	use 'theHamsta/nvim-dap-virtual-text'

end)
