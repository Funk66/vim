return {
  "neovim/nvim-lspconfig",
  opts = {
    format = {
      timeout_ms = 5000,
    },
    inlay_hints = { enabled = true },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
          },
        },
      },
      tsserver = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      },
    },
  },
}
