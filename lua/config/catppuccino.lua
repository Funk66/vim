local catppuccino = require("catppuccino")

catppuccino.setup({
	integrations = {
		barbar = true,
		gitsigns = true,
		telescope = true,
		indent_blankline = {
			enabled = true,
		},
		nvimtree = {
			enabled = true,
			show_root = true,
		},
	},
})

catppuccino.load("soft_manilo")
