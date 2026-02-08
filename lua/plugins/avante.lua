return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-5.2",
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
        ["gemini-cli"] = {
          command = "gemini",
          args = { "--experimental-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
          },
        },
        ["goose"] = {
          command = "goose",
          args = { "acp", "--with-builtin", "code_execution,developer" },
        },
      },
    },
  },
}
