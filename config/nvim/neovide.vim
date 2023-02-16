" Allow copy paste in neovim
let g:neovide_input_use_logo = 1
let g:neovide_cursor_trail_length = 0
let g:neovide_cursor_animation_length = 0
map <D-v> "+p<CR>
map! <D-v> <C-R>+
tmap <D-v> <C-R>+
vmap <D-c> "+y<CR>
nnoremap <D-v> a<C-r>+<Esc>
inoremap <D-v> <C-r>+
cnoremap <D-v> <C-r>+
tnoremap <D-v> <c-\><c-n>"*pi

if exists('g:neovide')
    let $PERL5LIB = '/Users/yurii.rochniak/perl5/lib/perl5'
    let $PERL_LOCAL_LIB_ROOT = '/Users/yurii.rochniak/perl5'
    let $PERL_MB_OPT = '--install_base "/Users/yurii.rochniak/perl5"'
    let $PERL_MM_OPT = 'INSTALL_BASE=/Users/yurii.rochniak/perl5'
    let $LANG = "en_US.UTF-8"
    let $LC_CTYPE = "en_US.UTF-8"
    let $TERM = "xterm-256color"
endif
