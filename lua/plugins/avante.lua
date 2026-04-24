return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "claude-code",
      providers = {
        ["llama"] = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:8080/v1",
          model = "qwen3",
          api_key_name = "LLAMA_API_KEY",
          timeout = 120000,
          extra_request_body = {
            temperature = 0.6,
            top_p = 0.95,
            max_tokens = 4096,
          },
        },
      },
      selector = {
        provider = "snacks",
      },
      input = {
        provider = "snacks",
      },
      windows = {
        spinner = {
          thinking = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        },
        input = {
          height = 10,
        },
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      web_search_engine = {
        provider = "tavily",
      },
      acp_providers = {
        ["claude-code"] = {
          command = "npx",
          args = { "-y", "-g", "@zed-industries/claude-code-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            ACP_PATH_TO_CLAUDE_CODE_EXECUTABLE = vim.fn.exepath("claude"),
          },
        },
      },
    },
  },
}
