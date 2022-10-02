require("plugins")
require("keybind")

-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- tuicolor
vim.o.termguicolors = true

-- neovide
vim.o.guifont = "Hack Nerd Font:h12"
vim.g.neovide_cursor_vfx_mode = "ripple"

-- mouse
vim.o.mouse = "a"

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- cursorline
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- indent
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- c indent
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.c", "*.h" },
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.expandtab = true
	end,
})
