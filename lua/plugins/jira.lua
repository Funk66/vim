return {
  "Funk66/jira.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("jira").setup()
  end,
  cond = function()
    return vim.env.JIRA_API_TOKEN ~= nil
  end,
}
