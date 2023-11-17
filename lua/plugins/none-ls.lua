local mypy = {
  cwd = function(params)
    if params.bufname:match("kialo/kialo") then
      return params.root .. "/backend"
    end
  end,
  extra_args = function(params)
    if params.bufname:match("kialo/kialo") then
      return {
        "--config-file",
        "mypy.ini",
        "--python-executable",
        os.getenv("VIRTUAL_ENV") .. "/bin/python3",
      }
    elseif params.bufname:match("kialo/k8s--resources") then
      return {
        "--python-executable",
        os.getenv("VIRTUAL_ENV") .. "/bin/python3",
      }
    end
  end,
  timeout = 30000,
}

local isort = {
  extra_args = function(params)
    return params.bufname:match("kialo") and { "--settings-path", "backend/.isort.cfg" } or {}
  end,
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
      nls.builtins.formatting.isort.with(isort),
      nls.builtins.formatting.sqlfmt,
    })
  end,
}
