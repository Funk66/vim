local lspsaga = require("lspsaga")
local map = require("cartographer")
local key = map.n.nore.silent

key["gh"] = ":Lspsaga lsp_finder<CR>"
lspsaga.init_lsp_saga()
