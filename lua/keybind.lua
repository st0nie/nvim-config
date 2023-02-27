local keymap = vim.keymap.set

vim.g.mapleader = " "
-- force save
keymap("n", "<leader>fw", "<cmd>SudaWrite<CR>", { silent = false })
vim.cmd("cnoreabbrev w!! SudaWrite")

-- terminal
keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { silent = true })
keymap("t", "<esc>", "<c-\\><c-n>", { silent = true })

-- session
keymap("n", "<leader>ss", "<cmd>mksession! ~/.vim_recently_session<CR>", { silent = true })
keymap("n", "<leader>sl", "<cmd>source ~/.vim_recently_session<CR>", { silent = true })

-- markdown preview
keymap("n", "<leader>m", "<cmd>MarkdownPreview<CR>", { silent = true })

-- outline
keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { silent = true })

-- buffers
keymap("n", "<leader>bf", ":ls <Cr>:b<Space>", { silent = false })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true })
keymap("n", "[b", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "]b", "<cmd>bnext<CR>", { silent = true })
keymap("n", "<leader>b[", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "<leader>b]", "<cmd>bnext<CR>", { silent = true })
keymap("n", "<leader>bn", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "<leader>bp", "<cmd>bnext<CR>", { silent = true })

-- format
keymap("n", "<F4>", "<cmd>Neoformat<CR>", { silent = true })

-- code_runner
keymap("n", "<leader>r", ":RunCode<CR>", { silent = true })
keymap("n", "<leader>rf", ":RunFile<CR>", { silent = true })
keymap("n", "<leader>rft", ":RunFile tab<CR>", { silent = true })
keymap("n", "<leader>rp", ":RunProject<CR>", { silent = true })
keymap("n", "<leader>rc", ":RunClose<CR>", { silent = true })
keymap("n", "<leader>crf", ":CRFiletype<CR>", { silent = true })
keymap("n", "<leader>crp", ":CRProjects<CR>", { silent = true })

-- nvim_tree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
keymap("n", "<leader>nf", ":NvimTreeFocus<CR>", { silent = true })
keymap("n", "<leader>nff", ":NvimTreeFindFile<CR>", { silent = true })
keymap("n", "<leader>nc", ":NvimTreeCollapse<CR>", { silent = true })

-- Lspsaga
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, { silent = true })
keymap("n", "<leader>fg", builtin.live_grep, { silent = true })
keymap("n", "<leader>fb", builtin.buffers, { silent = true })
keymap("n", "<leader>fh", builtin.help_tags, { silent = true })

-- dap
keymap("n", "<F5>", function()
	require("dap").continue()
end)
keymap("n", "<F10>", function()
	require("dap").step_over()
end)
keymap("n", "<F11>", function()
	require("dap").step_into()
end)
keymap("n", "<F12>", function()
	require("dap").step_out()
end)
keymap("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end)
keymap("n", "<Leader>dB", function()
	require("dap").set_breakpoint()
end)
keymap("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
keymap("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
keymap("n", "<Leader>dl", function()
	require("dap").run_last()
end)
keymap({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
keymap({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
keymap("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
keymap("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
