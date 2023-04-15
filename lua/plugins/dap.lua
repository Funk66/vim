return {
  "mfussenegger/nvim-dap-python",
  lazy = true,
  ft = { "python" },
  dependencies = {
    { "mfussenegger/nvim-dap" },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup({})
      end,
    },
  },
  config = function()
    require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
  end,
  keys = {
    {
      "<leader>dbc",
      '<cmd>lua require("dap").set_breakpoint(vim.ui.input("Breakpoint condition: "))<cr>',
      desc = "Conditional Breakpoint",
    },
    {
      "<leader>dbl",
      '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.ui.input("Log point message: "))<cr>',
      desc = "Logpoint",
    },
    { "<leader>dbr", '<cmd>lua require("dap.breakpoints").clear()<cr>', desc = "Remove All Breakpoints" },
    { "<leader>dbs", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Show All Breakpoints" },
    { "<leader>dbt", '<cmd>lua require("dap").toggle_breakpoint()<cr>', desc = "Toggle Breakpoint" },
    { "<leader>dc", '<cmd>lua require("dap").continue()<cr>', desc = "Continue" },
    {
      "<leader>dw",
      '<cmd>lua require("dap.ui.widgets").hover(nil, { border = "none" })<cr>',
      desc = "Evaluate Expression",
      mode = { "n", "v" },
    },
    { "<leader>dp", '<cmd>lua require("dap").pause()<cr>', desc = "Pause" },
    { "<leader>dr", "<cmd>Telescope dap configurations<cr>", desc = "Run" },
    { "<leader>dsb", '<cmd>lua require("dap").step_back()<cr>', desc = "Step Back" },
    { "<leader>dsc", '<cmd>lua require("dap").run_to_cursor()<cr>', desc = "Run to Cursor" },
    { "<leader>dsi", '<cmd>lua require("dap").step_into()<cr>', desc = "Step Into" },
    { "<leader>dso", '<cmd>lua require("dap").step_over()<cr>', desc = "Step Over" },
    { "<leader>dsx", '<cmd>lua require("dap").step_out()<cr>', desc = "Step Out" },
    { "<leader>dx", '<cmd>lua require("dap").terminate()<cr>', desc = "Terminate" },
    {
      "<leader>dvf",
      function()
        require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" })
      end,
      desc = "Show Frames",
    },
    {
      "<leader>dvr",
      function()
        require("dap").repl.open(nil, "20split")
      end,
      desc = "Show Repl",
    },
    {
      "<leader>dvs",
      function()
        require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" })
      end,
      desc = "Show Scopes",
    },
    {
      "<leader>dvt",
      function()
        require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" })
      end,
      desc = "Show Threads",
    },
    { "<leader>dr", '<cmd>lua require("dap").repl.open()<cr>', desc = "Repl" },
    { "<leader>du", '<cmd>lua require("dapui").toggle()<cr>', desc = "Dap UI" },
  },
}
