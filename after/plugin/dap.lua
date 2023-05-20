local dap = require('dap')

dap.adapters.lldb = {
	type = 'executable',
	command = 'lldb-vscode',
	name = 'lldb'
}
--[[
dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = function()
			return vim.fn.input('Current working directory: ', vim.fn.getcwd() .. '/', 'dir')
		end,
		stopOnEntry = false,
		args = {}
	}
}
--]]

vim.keymap.set('n', '<leader>bp', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>is', dap.repl.open)

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<C-F5>', dap.close)

require('nvim-dap-virtual-text').setup()
