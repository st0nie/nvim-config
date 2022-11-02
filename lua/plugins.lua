vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({
		"neovim/nvim-lspconfig",
		config = function()
			local servers = { "pyright", "sumneko_lua", "clangd", "rust_analyzer", "bashls" }
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			for i = 1, #servers do
				require("lspconfig")[servers[i]].setup({
					capabilities = capabilities,
				})
			end
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		after = { "nvim-autopairs" },
		config = function()
			vim.cmd("set completeopt=menu,menuone,noselect")
			require("cmp_setting")
		end,
	})
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			local tabnine = require("cmp_tabnine.config")

			tabnine.setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
				run_on_every_keystroke = true,
				snippet_placeholder = "..",
				ignored_file_types = {
					-- default is not to ignore
					-- uncomment to ignore in lua:
					-- lua = true
				},
				show_prediction_strength = false,
			})
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
			require("lualine").setup({
				options = {
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
				},
			})
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
				},
			})
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
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "python", "rust", "markdown", "fish" },
				auto_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
			})
		end,
	})

	use({
		"p00f/nvim-ts-rainbow",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup({
				show_end_of_line = true,
				space_char_blankline = " ",
			})
		end,
	})
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("code_runner").setup({
				-- put here the commands by filetype
				filetype = {
					python = "python3 -u",
					c = "cd $dir && clang $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
					PKGBUILD = "makepkg -sc",
					rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
				},
			})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					adaptive_size = true,
					mappings = {
						list = {
							{ key = "u", action = "dir_up" },
						},
					},
				},
				renderer = {
					group_empty = true,
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
				},
			})
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
			local db = require("dashboard")
			db.custom_header = {
				"                                                  ",
				"                                                  ",
				"                                                  ",
				"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
				"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
				"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
				"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
				"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
				"                                                  ",
				"                                                  ",
				"                                                  ",
			}
			db.custom_center = {
				{
					icon = "  ",
					desc = "Recently latest session      ",
					action = "source ~/.vim_recently_session",
				},
				{
					icon = "  ",
					desc = "Recently opened files        ",
					action = "Telescope oldfiles",
				},
				{
					icon = "  ",
					desc = "Find File                    ",
					action = "Telescope find_files",
				},
				{
					icon = "  ",
					desc = "File Browser                 ",
					action = "edit ./",
				},
				{
					icon = "  ",
					desc = "Find word                    ",
					action = "Telescope live_grep",
				},
				{
					icon = "  ",
					desc = "Open Personal dotfiles       ",
					action = "edit ~/.config/nvim",
				},
			}
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
