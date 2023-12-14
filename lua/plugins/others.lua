return {
  { "towolf/vim-helm", ft = "helm" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fx", "<cmd>Neotree focus<cr>", desc = "Focus NeoTree (root dir)", silent = true, mode = { "n" } },
    },
  },
  {
    "knsh14/cprl.nvim",
    keys = {
      { "<leader>go", "<cmd>CopyRemoteLink<cr>", desc = "Open code on github", silent = true, mode = { "n" } },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
