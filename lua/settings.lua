CACHE_PATH = vim.fn.stdpath("cache")

vim.cmd("filetype plugin on")
vim.cmd("colorscheme spacegray")

vim.g.mapleader = ","
vim.g.python3_host_prog = "/usr/bin/python"

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
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
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.undodir = CACHE_PATH .. "/undo"
vim.o.undofile = true
vim.o.updatetime = 300
