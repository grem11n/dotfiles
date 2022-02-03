call plug#begin()
" Color theme
Plug 'EdenEast/nightfox.nvim'
" Icons (many plugins depend on this)
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" Tabline
Plug 'romgrk/barbar.nvim'
Plug 'hoob3rt/lualine.nvim'
"" Text writing plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" General purpose
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'yaronkh/vim-winmanip'
Plug 'Yggdroot/indentLine'
Plug 'glepnir/dashboard-nvim'

" Terminal
Plug 'Lenovsky/nuake'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'stsewd/fzf-checkout.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" Directory tree
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

" General programming
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSInstall all'}
Plug 'lukas-reineke/format.nvim'

" Languages & LSP
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'saltstack/salt-vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'andrewstuart/vim-kubernetes'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'cespare/vim-toml'
Plug 'towolf/vim-helm'
Plug 'ekalinin/Dockerfile.vim'

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

"" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
Plug 'ojroques/nvim-lspfuzzy'
Plug 'weilbith/nvim-lsp-smag' " integrates LSP with ctags
Plug 'j-hui/fidget.nvim' " shows LSP loading

" Completion
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/nvim-cmp'

"" Experimental // Test
Plug 'ibhagwan/fzf-lua'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'simrat39/symbols-outline.nvim'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'

"" Good, but not often used
Plug 'vim-voom/VOoM'
Plug 'AndrewRadev/splitjoin.vim'

" Parking lot
Plug 'majutsushi/tagbar'
Plug 'folke/lsp-trouble.nvim'

"" Deprecated, not deleted yet
"Plug 'nvim-lua/completion-nvim'
"Plug 'steelsojka/completion-buffers'
"Plug 'nvim-treesitter/completion-treesitter'
"
" Plug 'f3fora/cmp-spell'
"
" Plug 'francoiscabrol/ranger.vim'
"
" Plug 'ray-x/lsp_signature.nvim'
" Plug 'kyazdani42/nvim-tree.lua'
"
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
"
" Plug 'hrsh7th/nvim-compe'
"
" Plug 'voldikss/vim-floaterm'
" Plug 'f-person/git-blame.nvim'

call plug#end()
