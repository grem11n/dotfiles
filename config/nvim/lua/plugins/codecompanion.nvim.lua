return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",           -- optional: slash-command completion
    "ibhagwan/fzf-lua",           -- optional: picker integration
    "nvim-tree/nvim-web-devicons", -- optional: icons
  },
  opts = {
    adapters = {
      -- Anthropic HTTP adapter — requires ANTHROPIC_API_KEY env var
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          schema = {
            model = {
              default = "claude-opus-4-5",
              choices = {
                "claude-opus-4-5",
                "claude-sonnet-4-5",
                "claude-haiku-4-5",
              },
            },
          },
        })
      end,
      -- ACP adapter — routes through the local Claude Code CLI (`claude` binary from Homebrew)
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {})
      end,
    },
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
      agent = {
        -- Use the ACP adapter for agentic tasks (claude binary handles tool calls natively)
        adapter = "claude_code",
      },
    },
    opts = {
      log_level = "ERROR",
      send_code = true,
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat toggle<cr>",    mode = { "n", "v" }, desc = "CodeCompanion Chat" },
    { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>",       mode = "v",          desc = "CodeCompanion Add selection" },
    { "<leader>ai", "<cmd>CodeCompanion<cr>",               mode = { "n", "v" }, desc = "CodeCompanion Inline" },
    { "<leader>ap", "<cmd>CodeCompanionActions<cr>",        mode = { "n", "v" }, desc = "CodeCompanion Actions" },
  },
}
