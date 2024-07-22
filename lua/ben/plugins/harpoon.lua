return {
	'theprimeagen/harpoon',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('harpoon').setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
				-- tabline = true,
			}
		})
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')
		vim.keymap.set('n', '<leader>h', function()
			ui.toggle_quick_menu()
		end, {})
		vim.keymap.set('n', '<leader>m', function()
			mark.add_file(vim.fn.expand('%'))
		end, {})

		for _, i in ipairs(vim.fn.range(9)) do
			vim.keymap.set('n', '<leader>' .. i, function()
				ui.nav_file(i)
			end, {})
		end
	end,
}
