local packer = require("packer")

packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use("nvim-lua/plenary.nvim")

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			config = function()
				require("config.null-ls")
			end,
		})

		use({
			"williamboman/nvim-lsp-installer",
			requires = { "neovim/nvim-lspconfig" },
			config = function()
				require("config.lsp")
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter")
			end,
		})

		use("Iron-E/nvim-cartographer")

		use("nvim-lua/popup.nvim")

		use("tjdevries/astronauta.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require("config.telescope")
			end,
			cmd = "Telescope",
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup()
			end,
		})

		use("kyazdani42/nvim-web-devicons")

		use({
			"romgrk/barbar.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("config.barbar")
			end,
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("config.tree").setup()
			end,
		})

		use({
			"b3nj5m1n/kommentary",
			config = function()
				require("config.kommentary")
			end,
		})

		use({
			"hrsh7th/nvim-compe",
			config = function()
				require("config.compe")
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("config.lualine")
			end,
		})

		use({
			"Pocco81/Catppuccino.nvim",
			config = function()
				require("config.catppuccino")
			end,
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("config.autopairs")
			end,
		})

		use("JoosepAlviste/nvim-ts-context-commentstring")

		use({
			"RRethy/vim-illuminate",
			event = "CursorHold",
			module = "illuminate",
			config = function()
				vim.g.Illuminate_delay = 1000
			end,
		})

		use({
			"towolf/vim-helm",
			ft = { "helm" },
		})

		use({
			"raimon49/requirements.txt.vim",
			ft = { "requirements" },
		})

		use({
			"plasticboy/vim-markdown",
			ft = { "markdown" },
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			requires = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("config.indent_blankline")
			end,
		})

		use({
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
		})

		use({
			"sindrets/diffview.nvim",
			cmd = {"DiffviewOpen", "DiffviewFileHistory"},
			config = function()
				require("config.diffview")
			end
		})

		use({
			"ruifm/gitlinker.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("config.gitlinker")
			end,
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
