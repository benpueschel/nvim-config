local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	local builtin = require('telescope.builtin')

	lsp.default_keymaps({buffer = bufnr})

	vim.keymap.set('n', 'gr', builtin.lsp_references, {})
	vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
end)

lsp.preset('recommended')

lsp.skip_server_setup({'clangd'})
lsp.setup()

require('clangd_extensions').setup() --TODO: not optimal, only call if clangd is installed?

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['['] = cmp.mapping.select_prev_item(cmp_select),
	[']'] = cmp.mapping.select_next_item(cmp_select),
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
