local keymap = vim.keymap.set

-- session
keymap("n", "<leader>ss", "<cmd>mksession! ~/.vim_recently_session<CR>", { silent = true })
keymap("n", "<leader>sl", "<cmd>source ~/.vim_recently_session<CR>", { silent = true })

-- markdown preview
keymap("n", "<leader>m", "<cmd>MarkdownPreview<CR>", { silent = true })

-- outline
keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { silent = true })
keymap("n", "<F6>", "<cmd>SymbolsOutline<CR>", { silent = true })

-- buffers
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true })
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "<F2>", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "<leader>bn", "<cmd>bnext<CR>", { silent = true })
keymap("n", "<F3>", "<cmd>bnext<CR>", { silent = true })

-- format
keymap("n", "<F4>", "<cmd>Neoformat<CR>", { silent = true })

-- terminal
keymap("n", "<F9>", "<cmd>FloatermNew<CR>", { silent = true })
keymap("t", "<F9>", [[<C-\><C-n><cmd>FloatermNew<CR>]], { silent = true })
keymap("n", "<F10>", "<cmd>FloatermPrev<CR>", { silent = true })
keymap("t", "<F10>", [[<C-\><C-n><cmd>FloatermPrev<CR>]], { silent = true })
keymap("n", "<F11>", "<cmd>FloatermNext<CR>", { silent = true })
keymap("t", "<F11>", [[<C-\><C-n><cmd>FloatermNext<CR>]], { silent = true })
keymap("n", "<A-d>", "<cmd>FloatermToggle<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>FloatermToggle<CR>]], { silent = true })
keymap("n", "<F12>", "<cmd>FloatermToggle<CR>", { silent = true })
keymap("t", "<F12>", [[<C-\><C-n><cmd>FloatermToggle<CR>]], { silent = true })

-- code_runner
keymap("n", "<F5>", ":RunCode<CR>", { silent = true })
keymap("n", "<leader>r", ":RunCode<CR>", { silent = true })
keymap("n", "<leader>rf", ":RunFile<CR>", { silent = true })
keymap("n", "<leader>rft", ":RunFile tab<CR>", { silent = true })
keymap("n", "<leader>rp", ":RunProject<CR>", { silent = true })
keymap("n", "<leader>rc", ":RunClose<CR>", { silent = true })
keymap("n", "<leader>crf", ":CRFiletype<CR>", { silent = true })
keymap("n", "<leader>crp", ":CRProjects<CR>", { silent = true })

-- nvim_tree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
keymap("n", "<F1>", ":NvimTreeToggle<CR>", { silent = true })
keymap("n", "<leader>nf", ":NvimTreeFocus<CR>", { silent = true })
keymap("n", "<leader>nff", ":NvimTreeFindFile<CR>", { silent = true })
keymap("n", "<leader>nc", ":NvimTreeCollapse<CR>", { silent = true })

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })

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
