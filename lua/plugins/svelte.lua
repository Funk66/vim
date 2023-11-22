return {
  -- Correctly setup lspconfig for Svelte
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        svelte = {},
      },
    },
  },
}
