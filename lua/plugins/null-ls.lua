local black = {
  extra_args = function(params)
    return params.bufname:match("kialo") and { "-l 120" } or {}
  end,
}

local mypy = {
  extra_args = function(params)
    local python_path = os.getenv("VIRTUAL_ENV") or "/usr"
    return params.bufname:match("kialo") and { "--config-file", "backend/mypy.ini", "--python-executable", python_path .. "/bin/python3"} or {}
  end,
}

local isort = {
  extra_args = function(params)
    return params.bufname:match("kialo") and { "--settings-path", "backend/.isort.cfg" } or {}
  end,
}

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.code_actions.gitsigns,
        nls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
        nls.builtins.diagnostics.mypy.with(mypy),
        nls.builtins.formatting.black.with(black),
        nls.builtins.formatting.eslint_d,
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.isort.with(isort),
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.sqlformat,
        nls.builtins.formatting.stylua,
      },
    }
  end,
}
