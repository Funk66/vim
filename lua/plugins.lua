return require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "glepnir/lspsaga.nvim"

    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "tjdevries/astronauta.nvim"
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      cmd = "Telescope"
    }
end)
