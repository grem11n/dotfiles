local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup diagnostics
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
    float = false,
    update_in_insert = false
})
vim.o.updatetime = 250
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    virtual_text = false,
--    underline = false,
--    signs = true,
--    update_in_insert = true,
--  }
--)

-- Mason: plugin to install language servers
require("mason").setup()

-- Setup LSPs
require'lspconfig'.groovyls.setup{
    capabilities = capabilities,
    cmd = {'java', '-jar', '/Users/yurii.rochniak/.vim/lsps/groovy-language-server-all.jar'};
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
  settings = {
	yaml = {
		-- FIX mapKeyOrder warning
		keyOrdering = false,
	},
  },
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
--require('lspfuzzy').setup {}
require 'lspsaga'.setup{}

--if not configs.helm_ls then
--  configs.helm_ls = {
--    default_config = {
--      cmd = {"helm_ls", "serve"},
--      filetypes = {'helm'},
--      root_dir = function(fname)
--        return util.root_pattern('Chart.yaml')(fname)
--      end,
--    },
--  }
--end
--
--lspconfig.helm_ls.setup {
--  filetypes = {"helm"},
--  cmd = {"helm_ls", "serve"},
--}
