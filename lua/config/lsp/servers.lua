return {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
					maxPreload = 10000,
				},
			},
		},
	},
	yamlls = {
		settings = {
			yaml = {
				schemas = {
					kubernetes = "manifests/*yaml",
					["https://json.schemastore.org/github-action.json"] = "/.github/workflows/*.y*ml",
					["https://json.schemastore.org/pre-commit-config.json"] = "/.pre-commit-config.yaml",
					["https://json.schemastore.org/kustomization.json"] = "*/kustomization.yaml",
					["https://raw.githubusercontent.com/awslabs/goformation/v5.2.11/schema/cloudformation.schema.json"] = "/templates/*.y*ml",
					["https://raw.githubusercontent.com/awslabs/goformation/v5.2.11/schema/sam.schema.json"] = "/sam/*.y*ml",
				},
			},
		},
	},
	jsonls = {
		settings = {
			json = {
				schemas = {
					{
						fileMatch = "/package.json",
						url = "https://json.schemastore.org/package.json",
					},
				},
			},
		},
	},
}
