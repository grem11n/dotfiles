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
set shell=/usr/local/bin/zsh

" Plug as a plugin managet
call plug#begin()

Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Test explorers
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jamessan/vim-gnupg'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'hashivim/vim-terraform'
Plug 'fidian/hexmode'
Plug 'rust-lang/rust.vim'
Plug 'rodjek/vim-puppet'
Plug 'Konfekt/FastFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'vim-voom/VOoM'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf.vim'
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
if has('nvim')
  Plug 'https://gitlab.com/Lenovsky/nuake.git'
endif
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Disabled because
" causes issues
Plug 'dyng/ctrlsf.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'rbong/vim-crystalline'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'saltstack/salt-vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'stsewd/fzf-checkout.vim'

"" Text writing plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'udalov/kotlin-vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'yaronkh/vim-winmanip'

call plug#end()

"" User Functions

" Create user aliases with arguments
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" Alias for NerdTree
call SetupCommandAlias("nt","NERDTree")
call SetupCommandAlias("ct","CHADopen")

" Alias for JSON pretty print
call SetupCommandAlias("ppj", "%!python -m json.tool")

" Configuration for Backspace key
set backspace=start,eol,indent

" Go to definition in vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


"" Theme config
syntax enable
set number
set background=dark
colorscheme PaperColor
" Fix for Vimr
if match(expand('$VIM'), 'VimR.app') > -1
    " set true color
    set termguicolors
endif

let g:airline_theme='papercolor'

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

set wildmenu
set wildmode=list:longest
set laststatus=2
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"" IncSearch
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>
"let g:incsearch#auto_nohlsearch = 1
"map n  <Plug>(incsearch-nohl-n)
"map N  <Plug>(incsearch-nohl-N)
"map *  <Plug>(incsearch-nohl-*)
"map #  <Plug>(incsearch-nohl-#)
"map g* <Plug>(incsearch-nohl-g*)
"map g# <Plug>(incsearch-nohl-g#)

" Airline config
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Find and highlight trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

"" NERD Tree
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" CHAD Tree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'CHADopen' | endif
let g:chadtree_settings = { 'follow': 'false', }

"" Markdown preview
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

"" Fugitive-vim config
let g:EditorConfig_exclude_patterns = ['scp://.*']

"" Golang
let $GOPATH = "$HOME/Golang"
let g:go_fmt_command = "goimports"
" let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

"" FZF
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>

"" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_save = 1
autocmd QuitPre * if empty(&bt) | lclose | endif
let g:ale_linters = {
  \ 'rust': [
  \   'rustc',
  \   'rustfmt'],
  \ 'python': [
  \   'flake8',
  \   'pylint'],
  \ 'go': [
  \    'gopls']
  \}

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Nuake
call SetupCommandAlias("term","Nuake")
let g:nuake_per_tab = 1
let g:nuake_size = 0.3
nnoremap <C-\> :Nuake<CR>
inoremap <C-\> <C-\><C-n>:Nuake<CR>
tnoremap <C-\> <C-\><C-n>:Nuake<CR>

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_setConceal = 0
let g:indentLine_conceallevel = 0
let g:indentLine_setColors = 0

"coc.nvim
let g:coc_global_extensions = [
        \ 'coc-dictionary',
        \ 'coc-word',
        \ 'coc-rls',
        \ 'coc-python',
        \ 'coc-highlight'
        \]
" if hidden is not set, TextEdit might fail.
set hidden
" Some server have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Test CrystalLine
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'papercolor'

set showtabline=2
set guioptions-=e
set laststatus=2

"" Vagrantfile
augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

"" Markdown Composer
let g:markdown_composer_autostart = 0

" autosave delay, cursorhold trigger, default: 4000ms
setl updatetime=300

" highlight the word under cursor (CursorMoved is inperformant)
highlight WordUnderCursor cterm=underline gui=underline
autocmd CursorHold * call HighlightCursorWord()
function! HighlightCursorWord()
    " if hlsearch is active, don't overwrite it!
    let search = getreg('/')
    let cword = expand('<cword>')
    if match(cword, search) == -1
        exe printf('match WordUnderCursor /\V\<%s\>/', escape(cword, '/\'))
    endif
endfunction

"" VimR colorscheme set 
if has("gui_vimr")
  set termguicolors
  set background=dark
  colorscheme PaperColor
endif

"" Terraform plugin
let g:terraform_fmt_on_save = 1

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

"" Terminal
tnoremap <Esc> <C-\><C-n>

let g:fzf_checkout_git_bin = 'git'

" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
