local indent_blankline = require("indent_blankline")
local map = require("cartographer")
local key = map.n.nore.silent

indent_blankline.setup({
	enabled = false,
	use_treesitter = true,
	show_current_context = true,
	show_first_indent_level = false,
	filetype_exclude = { "help", "terminal", "text", "markdown", "git", "NvimTree" },
})

vim.g.IndentBlanklineToggle = function()
	if vim.g.indent_blankline_enabled then
		return ":IndentBlanklineEnable<CR>"
	else
		return ":IndentBlanklineDisable<CR>"
	end
end

key["<leader>i"] = ":IndentBlanklineToggle<CR>"
