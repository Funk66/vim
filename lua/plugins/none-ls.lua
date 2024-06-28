local mypy = {
  extra_args = function()
    local venv = os.getenv("VIRTUAL_ENV")
    if venv then
      return {
        "--python-executable",
        venv .. "/bin/python3",
      }
    end
  end,
  timeout = 30000,
}

return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    vim.list_extend(opts.sources, {
      nls.builtins.diagnostics.actionlint,
      nls.builtins.diagnostics.mypy.with(mypy),
      nls.builtins.formatting.sqlfmt,
    })
  end,
}
