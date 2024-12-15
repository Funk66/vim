return {
  {
    "astephanh/yaml-companion.nvim",
    branch = "kubernetes_crd_detection",
    ft = { "yaml" },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function(_, opts)
      local cfg = require("yaml-companion").setup(opts)
      require("lspconfig")["yamlls"].setup(cfg)
      require("telescope").load_extension("yaml_schema")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_z = {
        {
          function()
            local schema = require("yaml-companion").get_buf_schema(0)
            if schema.result[1].name == "none" then
              return ""
            end
            return schema.result[1].name
          end,
        },
        opts.sections.lualine_z,
      }
    end,
  },
}
