return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>k",
      function()
        local explorer_pickers = Snacks.picker.get({ source = "explorer" })
        for _, v in pairs(explorer_pickers) do
          if v:is_focused() then
            v:close()
          else
            v:focus()
          end
        end
        if #explorer_pickers == 0 then
          Snacks.picker.explorer()
        end
      end,
    },
  },
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
    picker = {
      sources = {
        files = {
          include = { ".github" },
        },
        grep = {
          include = { ".github" },
        },
        explorer = {
          include = { ".github" },
        },
      },
    },
  },
}
