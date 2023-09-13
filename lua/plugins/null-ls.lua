local black = {
  extra_args = function(params)
    return params.bufname:match("kialo") and { "-l 120" } or {}
  end,
}

local mypy = {
  extra_args = function(params)
    return params.bufname:match("kialo")
        and {
          "--config-file",
          params.root .. "/backend/mypy.ini",
          "--python-executable",
          os.getenv("VIRTUAL_ENV") .. "/bin/python3",
        }
      or {}
  end,
}

local isort = {
  extra_args = function(params)
    return params.bufname:match("kialo") and { "--settings-path", "backend/.isort.cfg" } or {}
  end,
}

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    vim.list_extend(opts.sources, {
      nls.builtins.code_actions.gitsigns,
      nls.builtins.diagnostics.actionlint,
      nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
      nls.builtins.diagnostics.mypy.with(mypy),
      nls.builtins.formatting.black.with(black),
      nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.isort.with(isort),
      nls.builtins.formatting.sqlformat,
    })
  end,
}
