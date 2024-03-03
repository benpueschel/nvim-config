return {
	'p00f/clangd_extensions.nvim',
	event = 'BufReadPre',
	dependencies = {
		'neovim/nvim-lspconfig',
	},
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require('lspconfig').clangd.setup({
			capabilities = capabilities
		})
		require('clangd_extensions').setup()
	end
}
