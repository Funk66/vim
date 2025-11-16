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
      desc = "Focus explorer",
    },
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },
  },
  opts = {
    bigfile = { enabled = true },
    gh = { enabled = true },
    gitbrowse = {
      config = function(opts, _)
        table.insert(opts.remote_patterns, { "kialo.github.com", "github.com" })
      end,
    },
    image = { enabled = true },
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
