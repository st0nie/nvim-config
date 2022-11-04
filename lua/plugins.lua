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
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("plugconf.t9")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", requires = "hrsh7th/nvim-cmp" })
	use({
		"saadparwaiz1/cmp_luasnip",
		requires = "L3MON4D3/LuaSnip",
	})
	use({
		"Mofiqul/vscode.nvim",
		config = function()
			vim.cmd("colorscheme vscode")
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
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugconf.tree")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("glepnir/lspsaga.nvim")
	use({
		"voldikss/vim-floaterm",
		config = function()
			vim.g.floaterm_width = 0.8
			vim.g.floaterm_height = 0.8
		end,
	})
	use({
		"sbdchd/neoformat",
	})
	use({
		"glepnir/dashboard-nvim",
		after = { "telescope.nvim", "nvim-tree.lua" },
		config = function()
			require("plugconf.dashboard")
		end,
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
end)
