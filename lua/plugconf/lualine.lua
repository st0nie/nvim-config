require("lualine").setup({
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	extensions = { "quickfix", "man", "nvim-dap-ui", "nvim-tree", "symbols-outline", "toggleterm" },
})
