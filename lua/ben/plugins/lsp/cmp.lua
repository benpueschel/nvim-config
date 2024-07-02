return {
	'hrsh7th/nvim-cmp',

	event = 'VeryLazy',

	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'neovim/nvim-lspconfig',
		'petertriho/cmp-git',
	},

	config = function()
		local cmp = require('cmp')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = cmp.mapping.preset.insert({
			['<Esc>'] = cmp.mapping.abort(),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
			['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
			['<C-y>'] = cmp.mapping.confirm({ select = true }),
			['<CR>'] = cmp.mapping.confirm({ select = false }),
			['<C-Space>'] = cmp.mapping.complete(),
		})

		-- optional: custom kind icons (requires NerdFont)
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
			sources = cmp.config.sources(
				{
					{ name = 'git' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
				{
					{ name = 'buffer' },
				}
			),
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end
			},

			formatting = {
				fields = { 'abbr', 'kind' },
				expandable_indicator = true,
				format = function(entry, vim_item)
					-- Kind icons
					-- This concatenates the icons with the name of the item kind
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

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
		require('cmp_git').setup()
	end
}
