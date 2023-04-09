function DiffviewToggle()
  local lib = require("diffview.lib")
  local view = lib.get_current_view()
  if view then
    vim.cmd(":DiffviewClose")
  else
    vim.cmd(":DiffviewOpen")
  end
end

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>gd",
      function()
        DiffviewToggle()
      end,
      desc = "Toggle diff view",
    },
    {
      "<leader>gf",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "File git history",
    },
    {
      "<leader>gm",
      "<cmd>DiffviewOpen master...HEAD<cr>",
      desc = "Master diff",
    },
  },
  config = true,
}
