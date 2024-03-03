return {
	{
		'aserowy/tmux.nvim',
		event = 'VeryLazy',
		config = function ()
			require('tmux').setup({
				copy_sync = {
					enable = false,
				}
			})
		end
	}
}
