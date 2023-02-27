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
	use("glepnir/lspsaga.nvim")
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
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugconf.dap")
		end,
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
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local Path = require("plenary.path")
			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
				path_replacer = "__", -- The character to which the path separator will be replaced for session files.
				colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
				autoload_mode = require("session_manager.config").AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
				autosave_last_session = true, -- Automatically save last session on exit and on session switch.
				autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
				autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
					"gitcommit",
				},
				autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
				autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
				max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
			})
			local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {}) -- A global group for all your config autocommands

			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "SessionLoadPost",
				group = config_group,
				callback = function()
					require("nvim-tree").toggle(false, true)
				end,
			})
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function ()
			require('plugconf.tree')
		end
	})
end)
