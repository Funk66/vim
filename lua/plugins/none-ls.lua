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
      nls.builtins.code_actions.gitsigns,
      nls.builtins.diagnostics.actionlint,
      nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
      nls.builtins.diagnostics.mypy.with(mypy),
      nls.builtins.formatting.black,
      nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.sqlfmt,
    })
  end,
}