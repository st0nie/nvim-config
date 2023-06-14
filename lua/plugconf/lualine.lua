require("lualine").setup({
	-- winbar = {
	-- 	lualine_c = {
	-- 		{
	-- 			function()
	-- 				return " : " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~:.")
	-- 			end,
	-- 		},
	-- 	},
	-- 	lualine_x = {
	-- 		{
	-- 			function()
	-- 				return require("nvim-navic").get_location({ highlight = false })
	-- 			end,
	-- 			cond = function()
	-- 				return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
	-- 			end,
	-- 		},
	-- 	},
	-- },
	--
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 1,
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
