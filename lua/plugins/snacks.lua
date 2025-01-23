return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    gitbrowse = {
      config = function(opts, _)
        table.insert(opts.remote_patterns, { "kialo.github.com", "github.com" })
      end,
    },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scratch = {
      filekey = {
        cwd = true,
        branch = false,
        count = true,
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
