return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          cmd = { "gopls" },
          cmd_env = {
            GOPACKAGESDRIVER = vim.fn.expand("~/Workspace/nebo/nebazel/tools/gopackagesdriver.sh"),
          },
        },
      },
    },
  },
}
