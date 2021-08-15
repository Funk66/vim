require("config.lsp.ui")
local lspconfig = require("lspconfig")
local servers = require("config.lsp.servers")
local keymaps = require("config.lsp.mappings")

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	for keymap, cmd in pairs(keymaps) do
		vim.api.nvim_buf_set_keymap(bufnr, "n", keymap, cmd, { noremap = true, silent = true })
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

for server, config in pairs(servers) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 300,
		},
	}, config))
end
