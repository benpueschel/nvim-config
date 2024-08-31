return {
	'L3MON4D3/LuaSnip',
	version = 'v2.*',
	build = 'make install_jsregexp',
	config = function()
		local ls = require('luasnip')
		ls.config.set_config {
			history = true,
			updateevents = 'TextChanged,TextChangedI',
			enable_autosnippets = true,
		}

		vim.keymap.set({ 'i', 's' }, '<c-k>', function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })
		vim.keymap.set({ 'i', 's' }, '<c-j>', function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })
		vim.keymap.set('n', '<leader><leader>s', function()
			vim.cmd("source ~/.config/nvim/lua/ben/plugins/luasnip.lua")
			require('ben.plugins.luasnip').config()
		end)

		local parse = require("luasnip.util.parser").parse_snippet

		ls.add_snippets("go", {
			parse("ife", [[
				if ${1:err} != nil {
					return $0
				}]]),
		})
		ls.add_snippets("rust", {
			parse("new", [[
				fn new($1) -> Self {
					$2
					Self {
						$0
					}
				}]]),
			parse("tnew", [[
				fn new($1) -> Self
				where
					Self: Sized;]]),
		})
	end
}
