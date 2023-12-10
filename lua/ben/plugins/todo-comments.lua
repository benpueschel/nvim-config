return {
	{
		'folke/todo-comments.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		lazy = true,
		init = function()
			require('todo-comments').setup()
		end
	},
}
