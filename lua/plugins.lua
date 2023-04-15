require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	"folke/neodev.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
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
		event = "VeryLazy",
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
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugconf.blankline")
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		event = "VeryLazy",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("plugconf.runner")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "VeryLazy",
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
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				open_mapping = "<c-\\>",
				on_open = function(terminal)
					local nvimtree = require("nvim-tree")
					local nvimtree_view = require("nvim-tree.view")
					if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
						---@diagnostic disable-next-line: param-type-mismatch
						local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
						nvimtree.toggle()
						nvimtree_view.View.width = nvimtree_width
						nvimtree.toggle(false, true)
					end
				end,
			})
		end,
	},
	{
		"sbdchd/neoformat",
		event = "VeryLazy",
		config = function()
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				callback = function()
					local exclude_type = { "zsh" }
					local exclude_name = {}
					local exclude_ext = {}
					for i = 1, #exclude_type do
						if vim.bo.filetype == exclude_type[i] then
							return nil
						end
					end
					for i = 1, #exclude_name do
						if vim.fn.expand("%:t") == exclude_name[i] then
							return nil
						end
					end
					for i = 1, #exclude_ext do
						if vim.fn.expand("%:e") == exclude_ext[i] then
							return nil
						end
					end
					vim.cmd("undojoin | Neoformat")
				end,
			})
		end,
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
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			vim.g.suda_smart_edit = 1
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			require("telescope").setup({
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
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
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
})
