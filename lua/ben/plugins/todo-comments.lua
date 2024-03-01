return {
	{
		'folke/todo-comments.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		event = 'VeryLazy',
		init = function()
			require('todo-comments').setup()
		end
	},
}
