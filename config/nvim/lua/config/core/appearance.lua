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

-- Catppuccin theme
--require('catppuccin').setup {
--   flavour = "macchiato", -- latte, frappe, macchiato, mocha
--    background = { -- :h background
--        light = "latte",
--        dark = "macchiato",
--    },
--}
--require('catppuccin').load()

-- AYU theme
require('ayu').setup({
    mirage = true,
    overrides = {},
})
require('ayu').colorscheme()
