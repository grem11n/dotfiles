-- modern tagbar
return { "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen", "So" },
  keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
  },
  config = function ()
    vim.api.nvim_create_user_command('So', 'Outline', {})
    require("outline").setup {}
  end
}
