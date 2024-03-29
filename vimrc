if has('python2')
  silent! python3 1
endif
set nocompatible              " be iMproved, required
set wildignorecase
set tabstop=4 shiftwidth=4 expandtab
filetype off                  " required
filetype plugin on

" Re-map keys for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Find and Shell
set rtp+=/usr/local/opt/fzf
set shell=/opt/homebrew/bin/zsh

"" Source separate config files
" Install all the plugins
source ~/.config/nvim/config/plugins.vim
" Colorschemes, icons, infolines, etc.
source ~/.config/nvim/config/appearance.vim
" Command aliases
source ~/.config/nvim/config/aliases.vim
" Nuake terminal
source ~/.config/nvim/config/nuake.vim
" Golang configurations
source ~/.config/nvim/config/golang.vim
" UltiSnips
source ~/.config/nvim/config/UltiSnips.vim
" Neovide
source ~/.config/nvim/config/neovide.vim

" Configuration for Backspace key
set backspace=start,eol,indent

" Go to definition in vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


"" Fugitive-vim config
let g:EditorConfig_exclude_patterns = ['scp://.*']

"" FZF
let g:fzf_command_prefix = ''
"nnoremap <C-p> :Files<CR>
nnoremap <C-p> <cmd>lua require('fzf-lua').files()<CR>

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


"" Vagrantfile
augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

"" Markdown Composer
let g:markdown_composer_autostart = 0

" autosave delay, cursorhold trigger, default: 4000ms
setl updatetime=300

"" Terraform plugin
let g:terraform_fmt_on_save = 1

"" Terminal
tnoremap <Esc> <C-\><C-n>

let g:fzf_checkout_git_bin = 'git'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:dashboard_default_executive ='fzf'

" Workaround for gx issue:
" https://github.com/vim/vim/issues/4738
function! OpenURLUnderCursor()
  let s:uri = expand('<cfile>')
  echom "s:uri = " . s:uri
  if s:uri != ''
    silent exec "!open '".s:uri."'"
    :redraw!
  endif
endfunction
nnoremap gx :call OpenURLUnderCursor()<CR>

" Snippets
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Use netrw. neo-tree plugin disables it by default. 
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_hijack_netrw = 0

" Lua block
lua <<EOF
-- Configurations from separate configs
require('config.cmp')
require('config.lsp')
require('config.lualine')
require('config.format')
require('config.neo-tree')
require('config.dashboard')

-- Individual plugins
require"fidget".setup{}
require("nvim-dap-virtual-text").setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "phpdoc", "dockerfile" },
  highlight = {
    enable = false,
  },
}
EOF
