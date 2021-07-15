local map = require("cartographer")
local key = map.n.nore.silent

vim.g.bufferline = {
    icons = "both",
    closable = false,
}

key["<A-b>"] = ":buffer #<CR>"
key["<A-n>"] = ":BufferNext<CR>"
key["<A-v>"] = ":BufferPrevious<CR>"
key["<A-c>"] = ":BufferClose<CR>"
key["<A-m>"] = ":BufferPick<CR>"
key["<A-1>"] = ":BufferGoto 1<CR>"
key["<A-2>"] = ":BufferGoto 2<CR>"
key["<A-3>"] = ":BufferGoto 3<CR>"
key["<A-4>"] = ":BufferGoto 4<CR>"
key["<A-5>"] = ":BufferGoto 5<CR>"
key["<A-6>"] = ":BufferGoto 6<CR>"
key["<A-7>"] = ":BufferGoto 7<CR>"
key["<A-8>"] = ":BufferGoto 8<CR>"
key["<A-9>"] = ":BufferLast<CR>"
key["<A-,>"] = ":BufferMoveNext<CR>"
key["<A-.>"] = ":BufferMovePrevious<CR>"
