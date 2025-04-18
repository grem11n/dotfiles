local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

-- Disable logging until required
vim.lsp.set_log_level("off")


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end

-- Setup diagnostics
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
    float = false,
    update_in_insert = false
})
vim.o.updatetime = 250

-- Mason: plugin to install language servers
require("mason").setup()

-- Setup LSPs
--require'lspconfig'.groovyls.setup{
--    capabilities = capabilities,
--    cmd = {'java', '-jar', '/Users/yurii.rochniak/.vim/lsps/groovy-language-server-all.jar'};
--}
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
  on_attach = function(client, bufnr)
    -- Disable LSP for Helm templates (files with .yaml or .yml extension inside 'templates' directory)
    if vim.fn.expand('%:p'):match('.*/templates/.*%.ya?ml$') then
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      vim.lsp.buf_detach_client(bufnr, client.id)
    end
  end,
  capabilities = capabilities,
  settings = {
	yaml = {
		-- FIX mapKeyOrder warning
		keyOrdering = false,
        redhat = { telemetry = { enabled = false } },
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
require'lspconfig'.ts_ls.setup{
  capabilities = capabilities,
}
require'lspconfig'.eslint.setup{
  capabilities = capabilities,
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
}
require'lspconfig'.bashls.setup{
  capabilities = capabilities,
}

vim.env.PYENV_VERSION = vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')
require'lspconfig'.pylsp.setup{
  on_attach = custom_attach,
  settings = {
    configurationSources = {"flake8"},
    formatCommand = {"black"},
    pylsp = {
      plugins = {
          maxLineLength = 120,
          -- formatter options
          black = { enabled = true },
          flake8 = {
            enabled = true,
            maxLineLength = 100,
          },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          -- linter options
          pylint = {
            enabled = true,
            executable = "pylint",
            args = {'--ignore=E501,E231,C0114,C0115,C0116', '-'},
          },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          -- type checker
          pylsp_mypy = { enabled = true },
          -- auto-completion options
          jedi_completion = {
              fuzzy = true,
              include_class_objects = true,
              include_function_objects = true
          },
          jedi = {
              environment = os.getenv("VENV_PATH_PYLSP")
          },
          -- import sorting
          pyls_isort = { enabled = true },
          ignore={'E501', 'E231'},
      },
    },
  },
  flags = {
      debounce_text_changes = 200,
  },
  capabilities = capabilities,
}

require("lspconfig").pyright.setup {
  capabilities = capabilities,
}

require("lspconfig").ruff.setup {
  capabilities = capabilities,
}

require'lspconfig'.terraformls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

require'lspconfig'.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}
