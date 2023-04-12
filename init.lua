-- indent and skeleton
require("indent")
require("skeleton")
-- disable netrw
vim.g.loaded_netrw = 1
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
-- vim.o.cursorcolumn = true

-- indent
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("plugins")
