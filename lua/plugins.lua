vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugconf.lsp")
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		after = { "nvim-autopairs" },
		config = function()
			require("plugconf.cmp")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", requires = "hrsh7th/nvim-cmp" })
	use({
		"saadparwaiz1/cmp_luasnip",
		requires = "L3MON4D3/LuaSnip",
	})
	use({
		"sainnhe/sonokai",
		config = function()
			vim.cmd("colorscheme sonokai")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugconf.lualine")
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugconf.bufferline")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugconf.ts")
		end,
	})

	use({
		"p00f/nvim-ts-rainbow",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugconf.blankline")
		end,
	})
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugconf.runner")
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use({
		"sbdchd/neoformat",
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({ "onsails/lspkind.nvim" })
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	})
	use({ "lambdalisue/suda.vim" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
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
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugconf/dap-conf")
		end,
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		before = "rcarriga/nvim-dap-ui",
	})
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("plugconf.session")
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("plugconf.tree")
		end,
	})
	use({
		"numTostr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
end)
