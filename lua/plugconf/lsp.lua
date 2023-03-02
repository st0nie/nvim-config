local servers = { "pyright", "lua_ls", "clangd", "rust_analyzer", "bashls", "marksman", "gopls" }
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
for i = 1, #servers do
	require("lspconfig")[servers[i]].setup({
		capabilities = capabilities,
	})
end

-- lsp saga
require("lspsaga").setup({
	symbol_in_winbar = {
		enable = true,
		separator = " > ",
	},
})
