-- LazyGit client
return { "kdheepak/lazygit.nvim",
  cmd = {
  	"LazyGit",
  	"LazyGitConfig",
  	"LazyGitCurrentFile",
  	"LazyGitFilter",
  	"LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
  keys = {
      { "<leader>g", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
  },
}
