-- snippets
return { "dcampos/nvim-snippy",
  dependencies = {
    "dcampos/cmp-snippy",
    "honza/vim-snippets",
  },
  config = function()
    local map = vim.keymap.set
    -- Insert mode snippy completion mapping - '<Control-s>'
    map("i", "<C-s>", function()
      require('snippy').complete()
    end, { silent = true })
  end,
  opts = {
    mappings = {
      i = {
        ["<C-j>"] = "expand_or_advance",
        ["<C-k>"] = "previous",
      },
    },
  },
}
