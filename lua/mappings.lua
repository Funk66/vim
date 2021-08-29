local map = require("cartographer")
local key = map.n.nore.silent

key["<C-h>"] = "<C-w>h"
key["<C-j>"] = "<C-w>j"
key["<C-k>"] = "<C-w>k"
key["<C-l>"] = "<C-w>l"

key["<C-Up>"] = ":resize -2<CR>"
key["<C-Down>"] = ":resize +2<CR>"
key["<C-Left>"] = ":vertical resize -2<CR>"
key["<C-Right>"] = ":vertical resize +2<CR>"

key["<PageDown>"] = "<Nop>"
key["<PageUp>"] = "<Nop>"
map.i.silent["<PageDown>"] = "<Nop>"
map.i.silent["<PageUp>"] = "<Nop>"

key["<A-q>"] = ":quit<CR>"
key["<A-w>"] = ":write<CR>"

key["<A-f>"] = ":Telescope find_files<CR>"
key["<A-g>"] = ":Telescope grep_string<CR>"
key["<A-s>"] = ":Telescope live_grep<CR>"

key["<A-p>"] = ":SymbolsOutline<CR>"
