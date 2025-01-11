-- useful LSP commands
return { "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
  opts = {
    lightbulb = {
      enable = false, -- disables both
    },
  },
}
