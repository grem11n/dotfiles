-- highlight trailing whitespaces
return { "ntpeters/vim-better-whitespace",
  config = function()
      vim.cmd.highlight({ "ExtraWhitespace", "ctermbg=red", "guibg=red" })
  end,
}
