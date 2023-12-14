return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()
        if view then
          vim.cmd(":DiffviewClose")
        else
          vim.cmd(":DiffviewOpen")
        end
      end,
      desc = "Toggle diff view",
    },
    {
      "<leader>gf",
      "<cmd>'<,'>DiffviewFileHistory --no-merges<cr>",
      desc = "File git history",
      mode = { "v" },
    },
    {
      "<leader>gf",
      "<cmd>DiffviewFileHistory --no-merges %<cr>",
      desc = "File git history",
      mode = { "n" },
    },
    {
      "<leader>gm",
      "<cmd>DiffviewOpen master...HEAD<cr>",
      desc = "Master diff",
    },
  },
  config = true,
}
