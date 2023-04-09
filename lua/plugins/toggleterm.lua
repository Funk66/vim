function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

return {
  "akinsho/toggleterm.nvim",
  event = "BufWinEnter",
  version = "*",
  config = true,
  keys = {
    { "<A-1>", ":ToggleTerm direction=float<cr>", desc = "Toggle float term" },
    { "<A-2>", ":ToggleTerm direction=horizontal size=10<cr>", desc = "Toggle horizontal term" },
    { "<A-3>", ":ToggleTerm direction=vertical size=60<cr>", desc = "Toggle vertical term" },
    { "<leader>tl", ":ToggleTermSendCurrentLine <T_ID><cr>", desc = "Term send line" },
    { "<leader>tL", ":ToggleTermSendVisualLines <T_ID><cr>", desc = "Term send lines" },
    { "<leader>ts", ":ToggleTermSendVisualSelection <T_ID><cr>", desc = "Term send selection" },
  },
}
