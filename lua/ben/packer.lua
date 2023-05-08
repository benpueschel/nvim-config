-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Load plugins from plugins.lua
	for _, v in ipairs(require('ben.plugins')) do
		use(v)
	end

	-- Load themes from themes.lua
	for _, v in ipairs(require('ben.themes')) do
		use(v)
	end

end)
