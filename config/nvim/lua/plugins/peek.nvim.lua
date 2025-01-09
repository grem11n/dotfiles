-- markdown preview with mermaid
return { "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  cmd = {
    "PeekOpen",
    "PeekClose",
  },
  init = function()
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  end,
  opts = {
    auto_load = false,         -- whether to automatically load preview when
                              -- entering another markdown buffer
    close_on_bdelete = true,  -- close preview window on buffer delete
    syntax = true,            -- enable syntax highlighting, affects performance
    theme = 'dark',           -- 'dark' or 'light'
    update_on_change = true,
    app = 'webview',          -- 'webview', 'browser', string or a table of strings
    filetype = { 'markdown' },-- list of filetypes to recognize as markdown
    -- relevant if update_on_change is true
    throttle_at = 200000,     -- start throttling when file exceeds this
    throttle_time = 'auto',   -- minimum amount of time in milliseconds
  },
}
