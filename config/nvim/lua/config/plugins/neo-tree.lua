require("neo-tree").setup {
  filesystem = {
    hijack_netrw_behavior = "disabled",
    filtered_items = { --These filters are applied to both browsing and searching
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  }
}
