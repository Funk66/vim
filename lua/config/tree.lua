local M = {}

M.setup = function()
	local tree = require("nvim-tree")
	local map = require("cartographer")
	local key = map.n.nore.silent

	key["<A-o>"] = ":lua require('config.tree').toggle()<CR>"
	key["<A-i>"] = ":NvimTreeFindFile<CR>"
	key["<A-u>"] = ":NvimTreeRefresh<CR>"

	vim.g.nvim_tree_git_hl = 1
	vim.g.nvim_tree_gitignore = 1
	vim.g.nvim_tree_hide_dotfiles = 1
	vim.g.nvim_tree_highlight_opened_files = 1
	vim.g.nvim_tree_indent_markers = 1
	vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
	vim.g.nvim_tree_show_icons = {
		git = 0,
		folders = 1,
		files = 1,
		folder_arrows = 0,
	}

	tree.setup({
		auto_close = true,
		update_focused_file = {
			enable = true,
			update_cwv = true,
		},
		view = {
			mappings = {
				list = {
					{ key = "q", cb = ":lua require('config.tree').toggle()<CR>" },
				},
			},
		},
	})
end

M.toggle = function()
	local tree = require("nvim-tree")
	local view = require("nvim-tree.view")
	local state = require("bufferline.state")

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
