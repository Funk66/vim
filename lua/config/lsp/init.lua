require("config.lsp.ui")
local illuminate = require("illuminate")
local lsp_installer = require("nvim-lsp-installer")
local keymaps = require("config.lsp.mappings")
local servers = require("config.lsp.servers")
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

lsp_installer.on_server_ready(function(server)
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = false,
		severity_sort = true,
	})
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 300,
		},
	}
	if servers[server] ~= nil then
		vim.tbl_deep_extend(opts, servers[server])
	end
	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

nls.setup(on_attach)
