local nls = require("null-ls")
local lspconfig = require("lspconfig")

local black = {
	extra_args = function(params)
		return params.bufname:match("kialo") and { "-l 120" } or { "-l 80" }
	end,
}

local flake8 = {
	args = function(params)
		return {
			"--format",
			"default",
			"--config",
			params.bufname:match("kialo") and os.getenv("KIALO_ROOT") .. "/backend/.flake8" or ".flake8",
			"--stdin-display-name",
			"$FILENAME",
			"-",
		}
	end,
}

return {
	setup = function(on_attach)
		nls.config({
			sources = {
				nls.builtins.code_actions.gitsigns,
				nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
				nls.builtins.diagnostics.flake8.with(flake8),
				nls.builtins.diagnostics.hadolint,
				nls.builtins.diagnostics.mypy,
				nls.builtins.formatting.black.with(black),
				nls.builtins.formatting.eslint_d,
				nls.builtins.formatting.gofmt,
				nls.builtins.formatting.goimports,
				nls.builtins.formatting.isort,
				nls.builtins.formatting.json_tool,
				nls.builtins.formatting.prettierd,
				nls.builtins.formatting.shfmt,
				nls.builtins.formatting.sqlformat,
				nls.builtins.formatting.stylua,
			},
			save_after_format = false,
		})
		lspconfig["null-ls"].setup({ on_attach = on_attach })
	end,
}
