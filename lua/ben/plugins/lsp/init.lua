return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			'williamboman/mason-lspconfig.nvim', -- Optional
			'WhoIsSethDaniel/mason-tool-installer.nvim', -- Optional
			{ 'j-hui/fidget.nvim', opts = {} }, -- Optional
			'folke/trouble.nvim',               -- Optional
			{                                   -- Optional
				"folke/lazydev.nvim",
				ft = "lua",                     -- only load on lua files
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(event)
					local builtin = require('telescope.builtin')

					local opts = { buffer = event.buf }
					vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, opts)
					vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
					vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
					vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
					vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, opts)
					vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, opts)
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', '<leader>fm', function()
						vim.lsp.buf.format { async = true }
					end, opts)
					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
