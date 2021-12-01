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
				hover = true,
				completion = true,
				validate = true,
				schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
				schemas = {
					kubernetes = "manifests/**/*yaml",
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.{yml,yaml}",
					["https://json.schemastore.org/pre-commit-config.json"] = "/.pre-commit-config.yaml",
					["https://json.schemastore.org/kustomization.json"] = "*/kustomization.yaml",
					["https://raw.githubusercontent.com/awslabs/goformation/v5.2.11/schema/sam.schema.json"] = "/sam/*.{yml,yaml}",
					["https://raw.githubusercontent.com/awslabs/goformation/v5.2.11/schema/cloudformation.schema.json"] = {
						"/template.{yml,yaml}",
						"/templates/*.{yml,yaml}",
					},
				},
			},
		},
	},
	jsonls = {
		init_options = { provideFormatter = false },
		settings = {
			json = {
				schemas = {
					{
						fileMatch = { "package.json" },
						url = "https://json.schemastore.org/package.json",
					},
					{
						fileMatch = {
							"tsconfig.json",
							"tsconfig.*.json",
						},
						url = "https://json.schemastore.org/tsconfig.json",
					},
					{
						fileMatch = {
							".babelrc.json",
							".babelrc",
							"babel.config.json",
						},
						url = "https://json.schemastore.org/babelrc.json",
					},
					{
						fileMatch = {
							".eslintrc.json",
							".eslintrc",
						},
						url = "https://json.schemastore.org/eslintrc.json",
					},
					{
						fileMatch = {
							".prettierrc",
							".prettierrc.json",
							"prettier.config.json",
						},
						url = "https://json.schemastore.org/prettierrc",
					},
					{
						fileMatch = {
							".stylelintrc",
							".stylelintrc.json",
							"stylelint.config.json",
						},
						url = "https://json.schemastore.org/stylelintrc",
					},
					{
						fileMatch = {
							"*.cf.json",
							"cloudformation.json",
						},
						url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
					},
					{
						fileMatch = {
							"serverless.template",
							"*.sam.json",
							"sam.json",
						},
						url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
					},
					{
						fileMatch = { ".github/workflow-templates/**.properties.json" },
						url = "https://json.schemastore.org/github-workflow-template-properties.json",
					},
					{
						fileMatch = { "packer.json" },
						url = "https://json.schemastore.org/packer.json",
					},
				},
			},
		},
	},
}
