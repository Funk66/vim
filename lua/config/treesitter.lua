local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = "maintained",
	highlight = { enable = true, use_languagetree = true },
	indent = { enable = true },
	context_commentstring = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-n>",
			node_incremental = "<C-n>",
			scope_incremental = "<C-s>",
			node_decremental = "<C-r>",
		},
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
})
