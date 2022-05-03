vim.cmd(
	"command! LspUpdate LspInstall sumneko_lua tsserver bashls dockerls tailwindcss yamlls jsonls jedi_language_server gopls html terraformls"
)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

vim.keymap.set({ "n", "i" }, "<PageDown>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<PageUp>", "<Nop>")

vim.keymap.set("n", "<A-q>", ":quit<CR>")
vim.keymap.set("n", "<A-w>", ":write<CR>")

vim.keymap.set("n", "<A-f>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<A-g>", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<A-s>", ":Telescope live_grep<CR>")

vim.keymap.set("n", "<A-p>", ":SymbolsOutline<CR>")

vim.keymap.set("n", ",gd", ":DiffviewOpen<CR>")
vim.keymap.set("n", ",gc", ":DiffviewClose<CR>")
