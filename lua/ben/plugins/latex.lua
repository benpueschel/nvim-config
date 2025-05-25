return {
	"lervag/vimtex",
	lazy = false,     -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "skim"

		function _G.TexFocusVim()
			-- Only on macOS
			if vim.fn.has("mac") ~= 1 then
				return
			end

			local terminal = "WezTerm" -- or "Alacritty", etc.

			-- I'm not using any nvim GUI, so don't open a random terminal
			-- for gui users
			if vim.fn.has("gui_running") == 1 then
				return
			end

			vim.fn.system({ "open", "-a", terminal })
			vim.cmd.redraw()
		end

		-- Set up the autocmd group and handler
		vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true })

		vim.api.nvim_create_autocmd("User", {
			group = "vimtex_event_focus",
			pattern = "VimtexEventViewReverse",
			callback = function()
				TexFocusVim()
			end,
		})
		end
	}
