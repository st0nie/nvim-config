require("lualine").setup({
	winbar = {
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", path = 1, separator = ":" },
			{
				function()
					return require("nvim-navic").get_location()
				end,
				cond = function()
					return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
				end,
			},
		},
	},
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = {
				"toggleterm",
				"NvimTree",
				"alpha",
				"dapui_watches",
				"dapui_stacks",
				"dapui_breakpoints",
				"dapui_scopes",
				"dapui_console",
				"dap-repl",
			},
		},
	},
	extensions = { "quickfix", "man", "nvim-dap-ui", "nvim-tree", "symbols-outline", "toggleterm" },
})
