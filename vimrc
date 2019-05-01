if has('python2')
  silent! python3 1
endif
set nocompatible              " be iMproved, required
set wildignorecase
set number
filetype off                  " required
filetype plugin on

" Re-map keys for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set the runtime path to include Vundle and initialize
set rtp+=/usr/local/opt/fzf
set shell=/usr/local/bin/zsh

" Plug as a plugin managet
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'sjl/badwolf'
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
"Plugin 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'vim-voom/VOoM'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'euclio/vim-markdown-composer'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
if has('nvim')
  Plug 'https://gitlab.com/Lenovsky/nuake.git'
endif
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

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

"" Colors config

syntax enable
set background=dark
colorscheme badwolf

"" Pathogen part (needed for colorscheme?)

execute pathogen#infect()
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
let $GOPATH = "/Users/yurii.rochniak/Golang"
let g:go_fmt_command = "goimports"
"let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

"" FZF
"let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :Files<CR>

"" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_save = 1
autocmd QuitPre * if empty(&bt) | lclose | endif
let g:ale_linters = {'rust': ['rustc', 'rustfmt']}

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
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 0

" Nuake
let g:nuake_per_tab = 1

"Coc.nvim
let g:coc_global_extensions = [
        \ 'coc-dictionary',
        \ 'coc-word',
        \ 'coc-gocode',
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
