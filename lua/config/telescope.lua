local telescope = require("telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close
            }
        }
    }
})
