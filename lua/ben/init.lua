require('ben.remap')
require('ben.lazy')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.exrc = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

vim.opt.colorcolumn = "80"
vim.opt.inccommand = "split"

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("remove-trailing-whitespace", {}),
	command = ":%s/\\s\\+$//e",
})

-- briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", {}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.diagnostic.config({
	virtual_text = {
		current_line = true,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
