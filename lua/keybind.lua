vim.g.mapleader = " "
vim.cmd("cnoreabbrev w!! SudaWrite")

local wk = require("which-key")

vim.g.WK_shown = false

wk.setup({
	key_labels = { ["<leader>"] = "SPC" },
})

local function wk_alias(keys)
	local timeout = vim.o.timeoutlen
	if vim.g.WK_shown then
		vim.o.timeoutlen = 0
	end
	local key_codes = vim.api.nvim_replace_termcodes(keys, true, false, true)
	vim.api.nvim_feedkeys(key_codes, "m", false)
	local timer = vim.loop.new_timer()
	if timer == nil then
		return nil
	end
	timer:start(
		5,
		0,
		vim.schedule_wrap(function()
			vim.o.timeoutlen = timeout
			vim.g.WK_shown = false
		end)
	)
end

wk.register({
	mode = "n",
	["<c-\\>"] = {
		"Toggle Terminal",
	},
	["<leader>"] = {
		w = {
			function()
				wk_alias("<c-w>")
			end,
			"+window",
			name = "",
		},
		h = { "<cmd>WhichKey<cr>", "show keybinds" },
		f = {
			name = "files",
			w = { "<cmd>SudaWrite<cr>", "Force Write" },
			u = { "<cmd>SudaRead<cr>", "Force Read" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			g = { "<cmd>Telescope live_grep<cr>", "Find LiveGrep" },
			b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Helps" },
		},
		t = { "<cmd>ToggleTerm<cr>", "toggle terminal" },
		m = { "<cmd>MarkdownPreview<cr>", "markdown preview" },
		b = {
			name = "buffers",
			f = { "<cmd>Telescope find_files<cr>", "Find Buffers" },
			d = { "<cmd>bdelete<cr>", "Delete Buffer" },
			["["] = { "<cmd>bprevious<cr>", "Previous Buffer" },
			["p"] = { "<cmd>bprevious<cr>", "Previous Buffer" },
			["]"] = { "<cmd>bnext<cr>", "Next Buffer" },
			["n"] = { "<cmd>bnext<cr>", "Next Buffer" },
		},
		r = {
			name = "code_runner",
			r = { "<cmd>RunCode<cr>", "Run Code" },
			f = { "<cmd>RunFile<cr>", "Run File" },
			t = { "<cmd>RunFile tab<cr>", "Run File(Tab)" },
			p = { "<cmd>RunProject<cr>", "Run Project" },
			c = { "<cmd>RunClose<cr>", "Run Close" },
		},
		crf = { "<cmd>CRFiletype<cr>", "Edit Runner Filetype Config" },
		crp = { "<cmd>CRProjects<cr>", "Edit Runner Projects Config" },
		ca = { "<cmd>Lspsaga code_action<CR>", "Code Action", mode = { "n", "v" } },
		cd = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Cursor Diagnostics" },
		ci = { "<cmd>Lspsaga incoming_calls<CR>", "lsp Incoming calls" },
		co = { "<cmd>Lspsaga outgoing_calls<CR>", "lsp Outgoing calls" },
		lp = {
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			"Dap Set Breakpoint(Log)",
		},
		n = {
			name = "nvim_tree",
			t = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim-tree" },
			s = { "<cmd>NvimTreeFocus<cr>", "Switch to nvim-tree" },
			f = { "<cmd>NvimTreeFindFile<cr>", "Find Buffer in nvim-tree" },
			c = { "<cmd>NvimTreeCollapse<cr>", "Fold nvim_tree" },
		},
		d = {
			name = "debug",
			b = {
				function()
					require("dap").toggle_breakpoint()
				end,
				"Dap Toggle Breakpoint",
			},
			B = {
				function()
					require("dap").set_breakpoint()
				end,
				"Dap Set Breakpoint",
			},
			r = {
				function()
					require("dap").repl.open()
				end,
				"Dap repl Open",
			},
			l = {
				function()
					require("dap").run_last()
				end,
				"Dap Last Run",
			},
			h = {
				function()
					require("dap.ui.widgets").hover()
				end,
				"Dap-UI Hover",
			},
			p = {
				function()
					require("dap.ui.widgets").preview()
				end,
				"Dap-UI Preview",
			},
			f = {
				function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.frames)
				end,
				"Dap-UI Frames",
			},
			s = {
				function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.scopes)
				end,
				"Dap Last Run",
			},
		},
	},
	["<F17>"] = {
		function()
			require("dap").continue()
		end,
		"Dap Continue",
	},
	["<F10>"] = {
		function()
			require("dap").step_over()
		end,
		"Dap Step Over",
	},
	["<F11>"] = {
		function()
			require("dap").step_into()
		end,
		"Dap Step Into",
	},
	["<F12>"] = {
		function()
			require("dap").step_out()
		end,
		"Dap Step Out",
	},

	gh = { "<cmd>Lspsaga lsp_finder<CR>", "lsp Finder" },
	gr = { "<cmd>Lspsaga rename<CR>", "lsp Rename" },
	gd = { "<cmd>Lspsaga goto_definition<CR>", "lsp Goto_Definition" },
	gp = { "<cmd>Lspsaga peek_definition<CR>", "lsp Peek_Definition" },
	gt = { "<cmd>Lspsaga goto_type_definition<CR>", "lsp Type_Definition" },
	sl = { "<cmd>Lspsaga show_line_diagnostics<CR>", "lsp Show_Line_Diagnostics" },
	sb = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "lsp Show_Buffer_Diagnostics" },
	sw = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "lsp Show_Workspace_Diagnostics" },
	sc = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "lsp Show_Cursor_Diagnostics" },

	K = { "<cmd>Lspsaga hover_doc<CR>", "lsp Hover Doc" },
	["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
	["]E"] = {
		function()
			require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
		end,
		"Next Error",
	},
	["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic" },
	["[E"] = {
		function()
			require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end,
		"Previous Error",
	},
	["]b"] = { "<cmd>bnext<cr>", "Next Buffer" },
	["[b"] = { "<cmd>bprevious<cr>", "Previous Buffer" },
	["<F4>"] = { "<cmd>Neoformat<cr>", "Format Buffer" },
	["<F5>"] = { "<cmd>RunCode<cr>", "Run Code" },
	["<C-C>"] = { "Send <C-C> to the terminal" },
})

local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local exit_term_key = "<c-c>"

wk.register({
	[exit_term_key] = { termcodes("<C-\\><C-N>"), "escape terminal mode" },
}, { mode = "t" })
vim.api.nvim_set_keymap("t", "<c-w>", exit_term_key .. "<c-w>", { silent = true })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("n", exit_term_key, "i" .. exit_term_key, opts)
end

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = "term://*",
	callback = function()
		set_terminal_keymaps()
	end,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = "WhichKey",
	callback = function()
		vim.g.WK_shown = true
	end,
})
