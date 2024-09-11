-- Use Option + Enter to accept GitHub Copilot suggestions
-- C-CR did not work
vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr=true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true
