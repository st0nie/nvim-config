local keymap = vim.keymap.set

-- terminal
keymap("n", "<A-d>", "<cmd>FloatermToggle<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>FloatermToggle<CR>]], { silent = true })
keymap("n", "<leader>ra", "<cmd>FloatermNew --opener=edit ranger<CR>", { silent = true })
keymap("n", "<leader>ff", "<cmd>FloatermNew --opener=edit fzf<CR>", { silent = true })
keymap("n", "<leader>lg", "<cmd>FloatermNew lazygit<CR>", { silent = true })
vim.cmd(":command -nargs=1 Rg FloatermNew --opener=edit rg <args>")
keymap("n", "<leader>fg", ":Rg ", { silent = false })

-- session
keymap("n", "<leader>ss", "<cmd>mksession! ~/.vim_recently_session<CR>", { silent = true })
keymap("n", "<leader>sl", "<cmd>source ~/.vim_recently_session<CR>", { silent = true })

-- markdown preview
keymap("n", "<leader>m", "<cmd>MarkdownPreview<CR>", { silent = true })

-- outline
keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { silent = true })

-- buffers
keymap("n", "<leader>fb", ":ls <Cr>:b<Space>", { silent = false })
keymap("n", "<leader>db", "<cmd>bdelete<CR>", { silent = true })
keymap("n", "[b", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "]b", "<cmd>bnext<CR>", { silent = true })

-- format
keymap("n", "<F4>", "<cmd>Neoformat<CR>", { silent = true })

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
