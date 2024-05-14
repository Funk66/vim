return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      context = "buffer",
      window = {
        layout = "float",
        border = "rounded",
      },
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatCommit",
      "CopilotChatDocs",
      "CopilotChatFix",
      "CopilotChatReview",
      "CopilotChatTests",
      "CopilotChatToggle",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommitStaged",
    },
    init = function()
      require("which-key").register({
        C = {
          name = "Copilot",
          c = { "<cmd>CopilotChatCommit<cr>", "Write commit" },
          d = { "<cmd>CopilotChatDocs<cr>", "Write docs" },
          f = { "<cmd>CopilotChatFix<cr>", "Fix code" },
          r = { "<cmd>CopilotChatReview<cr>", "Review code" },
          t = { "<cmd>CopilotChatToggle<cr>", "Toggle window" },
          T = { "<cmd>CopilotChatTests<cr>", "Write tests" },
          x = { "<cmd>CopilotChatFixDiagnostic<cr>", "Fix diagnostic" },
        },
      }, { prefix = "<leader>", mode = { "n", "v" } })
    end,
  },
}
