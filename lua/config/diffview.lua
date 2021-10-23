local diffview = require("diffview")
local M = {}

M.setup = function()
	diffview.setup({
		enhanced_diff_hl = true,
		default_args = {
			DiffviewFileHistory = { "%" },
		},
	})
end

M.toggle = function()
	if view.win_open() then
		tree.close()
		state.set_offset(0)
	else
		tree.open()
		state.set_offset(31, "")
		local bufnr = vim.api.nvim_get_current_buf()
		local filename = vim.api.nvim_buf_get_name(bufnr)
		if filename then
			tree.find_file(true)
		end
	end
end
return M
