local nls = require("null-ls")
local lspconfig = require("lspconfig")
local utils = require("utils")

local black = {
	extra_args = function(params)
		return params.bufname:match("kialo") and { "-l 120" } or { "-l 80" }
	end,
}

local config = {
	flake8 = {
		args = function(params)
			local args = {
				"--format",
				"default",
				"--stdin-display-name",
				"$FILENAME",
				"-",
			}
			if params.bufname:match("kialo") then
				table.insert(args, 1, "--config=" .. os.getenv("KIALO_ROOT") .. "/backend/.flake8")
			end
			return args
		end,
	},
	mypy = {
		args = function(params)
			local mypy_config_file = params.root .. ".mypy.ini"
			if params.bufname:match("kialo") then
				mypy_config_file = os.getenv("KIALO_ROOT") .. "/backend/mypy.ini"
			elseif not utils.file_exists(mypy_config_file) then
				mypy_config_file = nil
			end

			local args = {
				"--hide-error-codes",
				"--hide-error-context",
				"--no-color-output",
				"--show-column-numbers",
				"--show-error-codes",
				"--no-error-summary",
				"--no-pretty",
				"--command",
				"$TEXT",
			}

			if mypy_config_file then
				table.insert(args, 1, "--config-file " .. mypy_config_file)
			end
			return args
		end,
	},
}

return {
	setup = function(on_attach)
		nls.config({
			debug = true,
			sources = {
				nls.builtins.code_actions.gitsigns,
				nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
				nls.builtins.diagnostics.flake8.with(config.flake8),
				nls.builtins.diagnostics.hadolint,
				nls.builtins.diagnostics.mypy.with(config.mypy),
				nls.builtins.formatting.black.with(black),
				nls.builtins.formatting.eslint_d,
				nls.builtins.formatting.gofmt,
				nls.builtins.formatting.goimports,
				nls.builtins.formatting.isort,
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
