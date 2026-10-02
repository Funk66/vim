return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "diff",
        "dockerfile",
        "gitignore",
        "jq",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "yaml",
      })
    end
  end,
}
