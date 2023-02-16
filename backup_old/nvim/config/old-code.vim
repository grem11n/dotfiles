"if exists('g:gnvim')
"    " GNvim-specific configuration goes here
"    set guifont=FiraCode\ Nerd\ Font:h18
"    nnoremap <D-v> a<C-r>+<Esc>
"    inoremap <D-v> <C-r>+
"    cnoremap <D-v> <C-r>+
"    tnoremap <D-v> <c-\><c-n>"*pi
"    
"    " Required for Neovim-qt GUI
"    set mouse=a
"    so $HOME/.config/nvim/macmap.vim
"    
"    let $PATH .= ':/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:/Users/yurii.rochniak/perl5/bin:/Users/yurii.rochniak/.nvm/versions/node/v14.15.0/bin:/usr/local/Cellar/tfenv/1.0.1/bin:/Users/yurii.rochniak/.yarn/bin:/Users/yurii.rochniak/.config/yarn/global/node_modules/.bin:/Users/yurii.rochniak/.krew/bin:/Users/yurii.rochniak/Golang/bin:/Users/yurii.rochniak/Library/Python/3.8/bin:/Users/yurii.rochniak/Library/Python/2.7/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/usr/local/go/bin:/Users/yurii.rochniak/.cargo/bin'
"    
"    let $PERL5LIB = '/Users/yurii.rochniak/perl5/lib/perl5'
"    let $PERL_LOCAL_LIB_ROOT = '/Users/yurii.rochniak/perl5'
"    let $PERL_MB_OPT = '--install_base "/Users/yurii.rochniak/perl5"'
"    let $PERL_MM_OPT = 'INSTALL_BASE=/Users/yurii.rochniak/perl5'
"    
"    let $LANG = "en_US.UTF-8"
"    let $LC_CTYPE = "en_US.UTF-8"
"    let $TERM = "xterm-256color"
"endif
"
" Test
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.treesitter = v:true
"let g:compe.source.vsnip = v:true
"let g:compe.source.ultisnips = v:true

lua <<EOF
--require'lsp_signature'.on_attach({
--  bind = true,
--  handler_opts = {
--    border = "single"
--  }
--})

EOF
