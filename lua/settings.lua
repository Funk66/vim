CACHE_PATH = vim.fn.stdpath("cache")

vim.cmd("filetype plugin on")
vim.cmd("colorscheme spacegray")

vim.g.mapleader = ","

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone"
vim.o.conceallevel = 2
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.foldlevelstart=99
vim.o.foldmethod = "indent"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.shiftwidth = 4
vim.o.showtabline = 2
vim.o.signcolumn = "number"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 100
vim.o.title = true
vim.o.titlestring = "%<%F%=%l/%L"
vim.o.undodir = CACHE_PATH .. "/undo"
vim.o.undofile = true
vim.o.updatetime = 300
