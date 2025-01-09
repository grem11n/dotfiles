-- Telescope
return { "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      layaout_strategy = "horizontal",
      layaout_config = {
        horizontal = {
          preview_cutoff = 0,
        },
      },
    },
  },
}
