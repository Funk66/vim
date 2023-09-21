return {
  { "towolf/vim-helm", ft = "helm" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fx", "<cmd>Neotree focus<cr>", desc = "Focus NeoTree (root dir)", silent = true, mode = { "n" } },
    },
  },
}
