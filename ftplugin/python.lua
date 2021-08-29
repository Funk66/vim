local nls = require("null-ls")
local path = vim.fn.expand("%:p:h")

local line_length = "80"
local flake8_config = ".flake8"

if string.find(path, "kialo") then
	line_length = "120"
	flake8_config = os.getenv("KIALO_ROOT") .. "/backend/.flake8"
end

vim.wo.colorcolumn = line_length

nls.register({
	nls.builtins.formatting.black.with({
		extra_args = { "-l " .. line_length },
	}),
	nls.builtins.diagnostics.flake8.with({
		args = {
			"--format",
			"default",
			"--config",
			flake8_config,
			"--stdin-display-name",
			"$FILENAME",
			"-",
		},
	}),
})
