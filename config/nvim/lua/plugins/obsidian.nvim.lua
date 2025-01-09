-- Obsidian notes integration
return { "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre /Users/yrochniak/Documents/Obsidian/Preply/**.md",
    "BufNewFile /Users/yrochniak/Documents/Obsidian/Preply/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "preply",
        path = "~/Documents/Obsidian/Preply",
      },
    },
  },
}
