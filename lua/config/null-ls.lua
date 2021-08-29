local nls = require("null-ls")
local lspconfig = require("lspconfig")

return {
	setup = function(on_attach)
		nls.config({
			sources = {
				nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
				nls.builtins.diagnostics.hadolint,
				nls.builtins.diagnostics.flake8,
				nls.builtins.formatting.eslint_d,
				nls.builtins.formatting.gofmt,
				nls.builtins.formatting.goimports,
				nls.builtins.formatting.isort,
				nls.builtins.formatting.json_tool,
				nls.builtins.formatting.prettierd,
				nls.builtins.formatting.shfmt,
				nls.builtins.formatting.sqlformat,
				nls.builtins.formatting.stylua,
				nls.builtins.code_actions.gitsigns,
			},
			save_after_format = false,
		})
		lspconfig["null-ls"].setup({ on_attach = on_attach })
	end,
}
