local nls = require("null-ls")

nls.config({
	sources = {
		nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
		nls.builtins.diagnostics.hadolint,
		nls.builtins.diagnostics.flake8,
		nls.builtins.formatting.black,
		nls.builtins.formatting.eslint_d,
		nls.builtins.formatting.gofmt,
		nls.builtins.formatting.goimports,
		nls.builtins.formatting.isort,
		nls.builtins.formatting.json_tool,
		nls.builtins.formatting.prettierd,
		nls.builtins.formatting.shfmt,
		nls.builtins.formatting.sqlformat,
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.terraform_fmt,
	},
	save_after_format = false,
})
