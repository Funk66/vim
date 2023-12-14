return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
      },
      config = function()
        local venv_path = os.getenv("VIRTUAL_ENV")
        local mason_path = require("mason-registry").get_package("debugpy"):get_install_path()
        local python_path = venv_path and (venv_path .. "/bin/python") or mason_path .. "/venv/bin/python"
        require("dap-python").setup(python_path, { pythonPath = python_path, include_configs = true })
      end,
    },
  },
}
