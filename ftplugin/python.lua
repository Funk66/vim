local path = vim.fn.expand("%:p:h")
vim.wo.colorcolumn = string.find(path, "kialo") and "120" or "80"
