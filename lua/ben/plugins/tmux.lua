return {
	{
		'aserowy/tmux.nvim',
		init = function ()
			require('tmux').setup({
				copy_sync = {
					enable = false,
				}
			})
		end
	}
}
