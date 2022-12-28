"" Theme config
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

syntax on
"colorscheme nightfox
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup()
EOF

colorscheme catppuccin

set number
set background=dark

" Command mode completion
set wildmenu
set wildmode=list:longest
set laststatus=2

" Find and highlight trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Highlight search results
set hlsearch
"nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <silent> <Esc> <Esc>:noh<CR>

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


" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" barbar.nvim
let bufferline = {}
let bufferline.closable = v:false
let bufferline.clickable = v:false

lua <<EOF
-- Nightfox colorscheme
local nightfox = require('nightfox')
nightfox.setup({
    options = {
        styles = {
            comments = "italic"
        }
    }
})
require("true-zen").setup {}
EOF
