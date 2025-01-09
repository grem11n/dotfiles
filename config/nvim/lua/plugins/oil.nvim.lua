-- oil.nvim is a plugin that provides a file explorer and a terminal in a single window.
return { "stevearc/oil.nvim",
  opts = { default_file_explorer = false, },
  setup = true,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
}
