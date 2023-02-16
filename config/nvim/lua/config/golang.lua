local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('go').setup({
    go='go',
    dap_debug_gui = true,
    dap_debug_vt = true,
    lsp_cfg = {
      capabilities = capabilities,
    },
})

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
