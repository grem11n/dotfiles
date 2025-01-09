-- Mason DAP integration
return { "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap", -- required by several plugins
  },
  opts = {
    -- list of debug adapters to install
    ensure_installed = {
      "bash-debug-adapter",
      "delve",
    },
	automatic_installation = true,
  },
}
