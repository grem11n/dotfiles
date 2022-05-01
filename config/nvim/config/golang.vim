set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"" Golang
let $GOPATH = "/Users/yuriirochniak/Golang"
"let g:go_fmt_command = "goimports"
let g:go_metalinter_command = 'golangci-lint'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = 'automatic'

au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

" Do not spawn too many instances of gopls
let g:go_gopls_enabled = 1
let g:go_gopls_options = ['-remote=auto']
