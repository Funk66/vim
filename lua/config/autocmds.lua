vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("disable_session_persistence", { clear = true }),
  pattern = { "gitcommit" },
  callback = function()
    require("persistence").stop()
  end,
})
