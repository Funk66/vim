return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "css",
        "diff",
        "dockerfile",
        "gitignore",
        "go",
        "html",
        "http",
        "ini",
        "javascript",
        "jq",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "svelte",
        "vim",
        "yaml",
      })
    end
  end,
}
