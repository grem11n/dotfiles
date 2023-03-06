-- Re-map keys for splits
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Remaps for LSP
vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', { silent = true })
--vim.keymap.set('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { silent = true })
vim.keymap.set('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { silent = true })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true })
vim.keymap.set('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { silent = true })
vim.keymap.set('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { silent = true })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true })
vim.keymap.set('n', '<A-]>', '<cmd>vsp <CR><cmd>lua vim.lsp.buf.definition()<CR>')

-- FZF Lua
vim.keymap.set('n', '<C-p>', function() require('fzf-lua').files() end)
vim.keymap.set('n', '<C-g>', function() require('fzf-lua').live_grep() end)

-- user commands
vim.api.nvim_create_user_command('Nt', 'NeoTreeRevealToggle', {})
vim.api.nvim_create_user_command('So', 'SymbolsOutline', {})
vim.api.nvim_create_user_command('Ppj', '%!python3 -m json.tool', {})

local vagrant = vim.api.nvim_create_augroup('vagrant', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = 'Vagrantfile',
    group = vagrant,
    command = 'set filetype=ruby',
})

-- to be able to exit terminal window
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
