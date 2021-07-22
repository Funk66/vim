local packer = require("packer")

packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use {
			'projekt0n/github-nvim-theme',
			config = 'require("github-theme").setup()',
		}

		use({
			"neovim/nvim-lspconfig",
			config = 'require("config.lsp")',
		})

		use({
			"kabouzeid/nvim-lspinstall",
			event = "VimEnter",
			config = 'require("config.lspinstall")',
		})

		use({
			"glepnir/lspsaga.nvim",
			config = 'require("config.lspsaga")',
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = "BufRead",
			config = 'require("config.treesitter")',
		})

		use({
			"mhartington/formatter.nvim",
			config = 'require("config.formatter")',
		})

		use("Iron-E/nvim-cartographer")

		use("nvim-lua/popup.nvim")

		use("nvim-lua/plenary.nvim")

		use("tjdevries/astronauta.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
			config = 'require("config.telescope")',
			cmd = "Telescope",
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = 'require("gitsigns").setup()',
		})

		use("kyazdani42/nvim-web-devicons")

		use({
			"romgrk/barbar.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = 'require("config.barbar")',
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = 'require("config.tree")',
		})

		use("b3nj5m1n/kommentary")

		use({
			"hrsh7th/nvim-compe",
			config = 'require("config.compe")',
		})

		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = 'require("config.lualine")',
		})

		use({
			"windwp/nvim-autopairs",
			config = 'require("config.autopairs")',
		})

		use({
			"karb94/neoscroll.nvim",
			config = 'require("neoscroll").setup()',
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
