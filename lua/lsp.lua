require("neodev").setup()

local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

require("lspconfig").clangd.setup({
	on_attach = on_attach,
})
local servers = { "pyright", "lua_ls", "clangd", "rust_analyzer", "bashls", "marksman", "gopls" }
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
for i = 1, #servers do
	require("lspconfig")[servers[i]].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end
