return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },             -- Required
			{                                        -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			{ 'p00f/clangd_extensions.nvim' },     -- Optional
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		},
		init = function() 
			local lsp = require('lsp-zero')

			lsp.on_attach(function(client, bufnr)
				local builtin = require('telescope.builtin')

				local opts = { buffer = bufnr }
				vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
				vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', '<leader>fm', function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end)

			require('mason').setup()
			require('mason-lspconfig').setup({
				handlers = {
					lsp.default_setup,
				}
			})

			require('clangd_extensions').setup() --TODO: not optimal, only call if clangd is installed?

			local cmp = require('cmp')
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_mappings = lsp.defaults.cmp_mappings({
				['<Esc>'] = cmp.mapping.abort(),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-]>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-[>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<CR>'] = cmp.mapping.confirm({ select = false }),
				['<C-Space>'] = cmp.mapping.complete(),
			})

			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}

			cmp.setup({
				mapping = cmp_mappings,
				window = {
					completion = cmp.config.window.bordered({
						size_padding = 2
					}),
					documentation = cmp.config.window.bordered({
						size_padding = 2,
					}),
				},

				formatting = {
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
						-- This concatenates the icons with the name of the item kind

						-- Source
						vim_item.menu = ({
							buffer = "",
							nvim_lsp = "",
							luasnip = "",
							nvim_lua = "",
							latex_symbols = "",
						})[entry.source.name]
						return vim_item
					end
				}
			})
		end,
	}
}
