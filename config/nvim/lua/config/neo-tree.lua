require("neo-tree").setup {
  filesystem = {
    filters = { --These filters are applied to both browsing and searching
      show_hidden = false,
      respect_gitignore = true,
    },
    use_libuv_file_watcher = false,
  }
}
