local servers = { "pyright", "sumneko_lua", "clangd", "rust_analyzer", "bashls", "marksman", "gopls" }
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
for i = 1, #servers do
	require("lspconfig")[servers[i]].setup({
		capabilities = capabilities,
	})
end
