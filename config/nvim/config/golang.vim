set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

"" Golang
let $GOPATH = "/Users/yurii.rochniak/Golang"
"let g:go_fmt_command = "goimports"
let g:go_metalinter_command = 'golangci-lint'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = 'automatic'
let g:go_doc_popup_window = 1

au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

" Do not spawn too many instances of gopls
let g:go_gopls_enabled = 1
let g:go_gopls_options = ['-remote=auto']

lua <<EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup({
  lsp_cfg = {
    capabilities = capabilities,
  },
})
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
EOF
