return {
	{
		'aserowy/tmux.nvim',
		lazy = true,
		init = function ()
			require('tmux').setup({
				copy_sync = {
					enable = false,
				}
			})
		end
	}
}
