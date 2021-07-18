vim.api.nvim_command("hi clear")
if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "spacegray"

local util = require("theme.util")
Config = require("theme.config")
C = require("theme.palette")
local highlights = require("theme.highlights")
local Treesitter = require("theme.Treesitter")
local markdown = require("theme.markdown")
local Git = require("theme.Git")
local LSP = require("theme.LSP")


local skeletons = {
    highlights, Treesitter, markdown, Git, LSP
}

for _, skeleton in ipairs(skeletons) do
    util.initialise(skeleton)
end
