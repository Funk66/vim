require("settings")
require("plugins")
require("mappings")

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
