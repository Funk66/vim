local black = {
  extra_args = function(params)
    return params.bufname:match("kialo") and { "-l 120" } or { "-l 80" }
  end,
}

local flake8 = {
  args = function(params)
    return {
      "--format",
      "default",
      "--config",
      params.bufname:match("kialo") and os.getenv("KIALO_ROOT") .. "/backend/.flake8" or ".flake8",
      "--stdin-display-name",
      "$FILENAME",
      "-",
    }
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
        nls.builtins.diagnostics.flake8.with(flake8),
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.mypy,
        nls.builtins.formatting.black.with(black),
        nls.builtins.formatting.eslint_d,
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.sqlformat,
        nls.builtins.formatting.stylua,
      },
    }
  end,
}
