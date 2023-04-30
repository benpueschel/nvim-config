function SetColorTheme(color)
	color = color or 'dracula'
	vim.cmd.colorscheme(color)
	
end
SetColorTheme()
