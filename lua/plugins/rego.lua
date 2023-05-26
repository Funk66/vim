local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

return {
  {
    "neovim/nvim-lspconfig",
    config = function(_, _)
      if not configs.regols then
        configs.regols = {
          default_config = {
            cmd = { "regols" },
            filetypes = { "rego" },
            root_dir = lspconfig.util.root_pattern(".git"),
          },
        }
      end
      lspconfig.regols.setup({})
    end,
  },
}
