require("config.lsp.ui")
local lspconfig = require("lspconfig")
local illuminate = require("illuminate")
local servers = require("config.lsp.servers")
local keymaps = require("config.lsp.mappings")
local nls = require("config.null-ls")

local on_attach = function(client, bufnr)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	for keymap, cmd in pairs(keymaps) do
		vim.api.nvim_buf_set_keymap(bufnr, "n", keymap, cmd, { noremap = true, silent = true })
	end

	if client.resolved_capabilities.document_highlight then
		illuminate.on_attach(client)
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

nls.setup(on_attach)
