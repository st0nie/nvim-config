if os.getenv("NVIM") ~= nil then
	require("lazy").setup({
		{ "willothy/flatten.nvim", config = true },
	})
	return
end

require("lazy").setup({
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").load()
		end,
	},
	"folke/neodev.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.maplocalleader = " "
			vim.g.mapleader = " "
		end,
		config = function()
			require("keybind")
		end,
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		config = function()
			require("lsp")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"petertriho/cmp-git",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"windwp/nvim-autopairs",
			"onsails/lspkind.nvim",
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("nvim-autopairs").setup({})
			require("plugconf/cmp")
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("plugconf.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugconf.bufferline")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugconf.ts")
		end,
		dependencies = "p00f/nvim-ts-rainbow",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.list = true
			vim.opt.listchars:append("eol:↴")
		end,
		config = function()
			require("plugconf.blankline")
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject" },
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
		config = function()
			require("plugconf.runner")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		lazy = true,
		cmd = "Lspsaga",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
					separator = " > ",
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		keys = {
			{ "<c-\\>", desc = "toggleterm" },
		},
		cmd = "ToggleTerm",
		config = function()
			require("toggleterm").setup({
				open_mapping = "<c-\\>",
				on_open = function(terminal)
					local nvimtree_view = require("nvim-tree.view")
					if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
						vim.cmd["NvimTreeClose"]()
						vim.cmd["NvimTreeOpen"]()
						vim.cmd["wincmd"]("p")
						vim.cmd["normal"]("i")
					end
				end,
			})
		end,
	},
	{
		"sbdchd/neoformat",
		event = "BufWritePre",
		cmd = "Neoformat",
		-- init = function()
		-- 	vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		-- 		callback = function()
		-- 			local exclude_type = { "zsh" }
		-- 			local exclude_name = {}
		-- 			local exclude_ext = {}
		-- 			for i = 1, #exclude_type do
		-- 				if vim.bo.filetype == exclude_type[i] then
		-- 					return nil
		-- 				end
		-- 			end
		-- 			for i = 1, #exclude_name do
		-- 				if vim.fn.expand("%:t") == exclude_name[i] then
		-- 					return nil
		-- 				end
		-- 			end
		-- 			for i = 1, #exclude_ext do
		-- 				if vim.fn.expand("%:e") == exclude_ext[i] then
		-- 					return nil
		-- 				end
		-- 			end
		-- 			vim.cmd([[try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry]])
		-- 		end,
		-- 	})
		-- end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},
	{
		"lambdalisue/suda.vim",
		init = function()
			vim.cmd("cnoreabbrev w!! SudaWrite")
			vim.g.suda_smart_edit = 1
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		lazy = true,
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = { prompt_position = "top" },
					mappings = {
						i = {
							["<C-j>"] = {
								actions.move_selection_next,
								type = "action",
								opts = { nowait = true, silent = true },
							},
							["<C-k>"] = {
								actions.move_selection_previous,
								type = "action",
								opts = { nowait = true, silent = true },
							},
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" },
		config = function()
			require("plugconf/dap-conf")
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"Shatur/neovim-session-manager",
		config = function()
			require("plugconf.session")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		init = function()
			local function open_nvim_tree(data)
				local directory = vim.fn.isdirectory(data.file) == 1
				if not directory then
					return
				end
				vim.cmd.cd(data.file)
				require("nvim-tree.api").tree.open()
			end

			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
		end,
		config = function()
			require("plugconf.tree")
		end,
	},
	{
		"numTostr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("nvim-navic").setup({
				highlight = true,
			})
		end,
	},
	{
		"willothy/flatten.nvim",
		opts = {
			window = {
				open = "alternate",
			},
			callbacks = {
				should_block = function(argv)
					return vim.tbl_contains(argv, "-b")
				end,
				post_open = function(bufnr, winnr, ft, is_blocking)
					if is_blocking then
						require("toggleterm").toggle(0)
					else
						vim.api.nvim_set_current_win(winnr)
					end
					if ft == "gitcommit" then
						vim.api.nvim_create_autocmd("BufWritePost", {
							buffer = bufnr,
							once = true,
							callback = function()
								vim.defer_fn(function()
									vim.api.nvim_buf_delete(bufnr, {})
								end, 50)
							end,
						})
					end
				end,
				block_end = function()
					vim.defer_fn(function()
						require("toggleterm").toggle(0)
					end, 10)
				end,
			},
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		end,
		config = function()
			require("plugconf.ufo_conf")
		end,
	},
	{
		"lewis6991/satellite.nvim",
		event = "VeryLazy",
		config = function()
			require("satellite").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
		config = function()
			require("plugconf.bbq")
		end,
	},
})
