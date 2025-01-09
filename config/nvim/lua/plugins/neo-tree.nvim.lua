-- directory tree
return { "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    use_libuv_file_watcher = true,
    follow_current_file = {
        enabled = true,
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      filtered_items = { --These filters are applied to both browsing and searching
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
