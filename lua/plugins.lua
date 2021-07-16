return require("packer").startup({function()
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "glepnir/lspsaga.nvim"

    use 'Iron-E/nvim-cartographer'

    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "tjdevries/astronauta.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = 'require("config.telescope")',
      cmd = "Telescope",
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = 'require("gitsigns").setup()',
    }

    use "kyazdani42/nvim-web-devicons"
    use {
        "romgrk/barbar.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = 'require("config.barbar")',
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = 'require("config.nvim-tree")',
    }
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
