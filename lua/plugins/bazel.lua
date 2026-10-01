return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        starpls = {
          cmd = {
            "starpls",
            "server",
            "--experimental_infer_ctx_attributes",
            "--experimental_use_code_flow_analysis",
            "--experimental_enable_label_completions",
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        bzl = { "buildifier" },
      },
    },
  },
}
