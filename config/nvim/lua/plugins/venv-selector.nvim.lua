-- select Python venv
return { 'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    --'mfussenegger/nvim-dap-python',
  },
  opts = {},
  event = 'VeryLazy',
}
