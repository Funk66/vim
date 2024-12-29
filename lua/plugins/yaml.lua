return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["/Users/guillermo/.local/share/k8s-schema-merger/all.json"] = {
                  "base/*/*.y*ml",
                  "!base/*/kustomization.y*ml",
                  "manifests/*/*/*.y*ml",
                },
              },
            },
          },
        },
      },
    },
  },
}
