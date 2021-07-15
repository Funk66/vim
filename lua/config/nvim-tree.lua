local map = require("cartographer")
local key = map.n.nore.silent
local tree = require("nvim-tree")
local view = require("nvim-tree.view")
local state = require("bufferline.state")

vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_tab_open = 1
-- vim.g.nvim_tree_bindings = {{key = "w", cb = ":edit asdf<CR>"}}

key["<A-o>"] = ":lua require('config.nvim-tree').toggle()<CR>"
key["<A-i>"] = ":NvimTreeFindFile<CR>"
key["<A-u>"] = ":NvimTreeRefresh<CR>"

return {
  toggle = function()
    if view.win_open() then
      state.set_offset(0)
      tree.close()
    else
      state.set_offset(31, "")
      -- Check if empty buffer
      tree.find_file(true)
    end
  end
}
