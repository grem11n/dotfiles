if has('python2')
  silent! python3 1
endif
set nocompatible              " be iMproved, required
set wildignorecase
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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go'
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
" Plug 'Yggdroot/indentLine'
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'dyng/ctrlsf.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'rbong/vim-crystalline'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'saltstack/salt-vim'

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

" Alias for JSON pretty print
call SetupCommandAlias("ppj", "%!python -m json.tool")

" Configuration for Backspace key
set backspace=start,eol,indent


"" Theme config
syntax enable
set number
set background=dark
colorscheme PaperColor

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
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

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
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" Markdown preview
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

"" Fugitive-vim config
let g:EditorConfig_exclude_patterns = ['scp://.*']

"" Golang
let $GOPATH = "$HOME/Golang"
let g:go_fmt_command = "goimports"
"let g:go_fmt_command = "gofmt"
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
  \   'pylint']
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
nnoremap <C-\> :Nuake<CR>
inoremap <C-\> <C-\><C-n>:Nuake<CR>
tnoremap <C-\> <C-\><C-n>:Nuake<CR>

" indentLine
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 0

" Nuake
let g:nuake_per_tab = 1

"Coc.nvim
let g:coc_global_extensions = [
        \ 'coc-dictionary',
        \ 'coc-word',
        "\ 'coc-gocode',
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
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

" " Terraform formatting
" " Ensure no conflict with arguments from the environment
" let $TF_CLI_ARGS_fmt=''
" command! -nargs=0 -buffer TerraformFmt call Terraform_fmt()
" function! Terraform_fmt()
"   if !filereadable(expand('%:p'))
"     return
"   endif
"   let l:curw = winsaveview()
"   " Make a fake change so that the undo point is right.
"   normal! ix
"   normal! "_x
"   silent execute '%!terraform fmt -no-color -'
"   if v:shell_error != 0
"     let output = getline(1, '$')
"     silent undo
"     echo join(output, "\n")
"   endif
"   call winrestview(l:curw)
" endfunction
