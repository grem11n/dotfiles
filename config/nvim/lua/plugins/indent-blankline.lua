 -- indent lines
return { "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  cmd = {
      "IBLToggle",
      "IBLEnable",
      "IBLDisable",
      "IBLToggleScope",
      "IBLEnableScope",
      "IBLDisableScope",
  },
  opts = {
    enabled = false,
  },
}
