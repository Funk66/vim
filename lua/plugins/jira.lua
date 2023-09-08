return {
  "Funk66/jira.nvim",
  dependencies = {
    { "jcdickinson/http.nvim", build = "cargo build --workspace --release" },
  },
  config = function()
    require("jira").setup()
  end,
  cond = function()
    return vim.env.JIRA_API_TOKEN ~= nil
  end,
}
