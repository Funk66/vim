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
  cmd = { "ToggleTerm", "ToggleTermSendCurrentLine", "ToggleTermSendVisualLines", "ToggleTermSendVisualSelection" },
  version = "*",
  config = true,
  keys = {
    { "<A-1>", ":ToggleTerm direction=float<cr>", desc = "Toggle float term", silent = true },
    { "<A-2>", ":ToggleTerm direction=horizontal size=30<cr>", desc = "Toggle horizontal term", silent = true },
    { "<A-3>", ":ToggleTerm direction=vertical size=60<cr>", desc = "Toggle vertical term", silent = true },
    { "<leader>tl", ":ToggleTermSendCurrentLine <T_ID><cr>", desc = "Term send line", silent = true },
    { "<leader>tL", ":ToggleTermSendVisualLines <T_ID><cr>", desc = "Term send lines", silent = true, mode = { "v" } },
    {
      "<leader>ts",
      ":ToggleTermSendVisualSelection <T_ID><cr>",
      desc = "Term send selection",
      silent = true,
      mode = { "v" },
    },
  },
}
