local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup diagnostics
vim.diagnostic.config({
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    virtual_text = false,
--    underline = false,
--    signs = true,
--    update_in_insert = true,
--  }
--)

-- Setup LSPs
require'lspconfig'.groovyls.setup{
    capabilities = capabilities,
    cmd = {'java', '-jar', '/Users/yuriirochniak/.vim/lsps/groovy-language-server-all.jar'};
}
require'lspconfig'.gopls.setup{
  cmd = { "gopls", "-remote=auto" },
  capabilities = capabilities,
}
require'lspconfig'.golangci_lint_ls.setup{
  capabilities = capabilities
}
require'lspconfig'.diagnosticls.setup{
  capabilities = capabilities,
}
require'lspconfig'.yamlls.setup{
  capabilities = capabilities,
}
require'lspconfig'.dockerls.setup{
  capabilities = capabilities,
}
require'lspconfig'.bashls.setup{
  capabilities = capabilities,
}
require'lspconfig'.jsonls.setup{
  capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
}
require'lspconfig'.bashls.setup{
  capabilities = capabilities,
}
require'lspconfig'.pylsp.setup{
  capabilities = capabilities,
}

require("trouble").setup {}
require('lspfuzzy').setup {}
require 'lspsaga'.setup{}
