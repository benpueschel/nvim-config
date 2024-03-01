return {
	{
		'neovim/nvim-lspconfig',
		event = 'VeryLazy',
		dependencies = {
			{ -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			'williamboman/mason-lspconfig.nvim', -- Optional
			'WhoIsSethDaniel/mason-tool-installer.nvim', -- Optional
			'j-hui/fidget.nvim',                -- Optional
			'folke/trouble.nvim',               -- Optional
			'folke/neodev.nvim',                -- Optional
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local builtin = require('telescope.builtin')

					local opts = { buffer = ev.buf }
					vim.keymap.set('n', '<leader>gl', builtin.diagnostics, opts)
					vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
					vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
					vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', '<leader>fm', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities = vim.tbl_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

			require('neodev').setup()

			local servers = {
				lua_ls = {
					runtime = { version = 'LuaJIT' },
					workspace = {
						checkThirdParty = false,
						-- Tells lua_ls where to find all the Lua files that you have loaded
						-- for your neovim configuration.
						library = {
							'${3rd}/luv/library',
							unpack(vim.api.nvim_get_runtime_file('', true)),
						},
					},
				}
			}
			require('mason').setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				'stylua', -- Used to format lua code
			})
			require('mason-tool-installer').setup { ensure_installed = ensure_installed }
			require('mason-lspconfig').setup {
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						require('lspconfig')[server_name].setup {
							cmd = server.cmd,
							settings = server.settings,
							filetypes = server.filetypes,
							-- This handles overriding only values explicitly passed
							-- by the server configuration above. Useful when disabling
							-- certain features of an LSP (for example, turning off formatting for tsserver)
							capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
						}
					end,
					['rust-analyzer'] = nil,
				},
			}
		end,
	},
	require('ben.plugins.lsp.cmp'),
	require('ben.plugins.lsp.clangd'),
	require('ben.plugins.lsp.rust_analyzer'),
}
