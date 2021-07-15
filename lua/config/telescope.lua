local telescope = require("telescope")
local map = require("cartographer")
local key = map.n.nore.silent

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close
            }
        }
    }
})

key["<C-f>"] = ":Telescope find_files<CR>"
key["<A-g>"] = ":Telescope grep_string<CR>"
key["<A-s>"] = ":Telescope live_grep<CR>"
