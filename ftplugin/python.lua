local nls = require("null-ls")
local path = vim.fn.expand("%:p:h")

local line_length = "80"

if string.find(path, "kialo") then
	line_length = "120"
	nls.register(nls.builtins.formatting.black.with({
		args = { "-l " .. line_length },
	}))
else
	nls.register(nls.builtins.formatting.black)
end

vim.wo.colorcolumn = line_length
