return {
	'github/copilot.vim',
	event = 'VeryLazy',
	config = function()
		vim.keymap.set('n', '<leader>cp', ":Copilot<CR>", {})
	end,
}
