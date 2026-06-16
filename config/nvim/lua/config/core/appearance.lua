-- Appearance
vim.cmd("syntax on")
vim.opt.number = true
vim.opt.wildmenu = true
vim.opt.wildmode = { list = 'longest' }
vim.opt.laststatus = 2
vim.opt.background = "dark"
-- Highlight search results
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>noh<cr>', { silent = true })
