local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- plugins that don't require additional settings go first
-- just because it's more readable
local plugins = {
    -- --------------------------------------------------------------------------
    -- Appearance --
    -- --------------------------------------------------------------------------
    "RRethy/vim-illuminate", -- highlight functon under cursor after certain time
    'lukas-reineke/indent-blankline.nvim', -- indent lines
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- colorscheme
    { "freddiehaddad/feline.nvim", config = true }, -- statusline
    { "akinsho/bufferline.nvim", -- bufferline
        version = "v3.*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = true,
    },
    { 'goolord/alpha-nvim', -- startup page
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },
    { "ntpeters/vim-better-whitespace", -- highlight trailing whitespaces
      config = function()
          vim.cmd.highlight({ "ExtraWhitespace", "ctermbg=red", "guibg=red" })
      end,
    },
    { "Pocco81/true-zen.nvim", -- focus mode
        dependencies = { "folke/twilight.nvim" },
    },
    { "nvim-neo-tree/neo-tree.nvim", -- directory tree
        cmd = "NeoTreeRevealToggle",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

    -- --------------------------------------------------------------------------
    -- General Purpose --
    -- --------------------------------------------------------------------------
    'junegunn/vim-peekaboo', -- preview of tre copy buffers
    'yaronkh/vim-winmanip', -- move open splits around
    'AndrewRadev/splitjoin.vim', -- swap between one-liner and multiline with gJ and gS
    'famiu/bufdelete.nvim', -- close buffers easier
    { 'simrat39/symbols-outline.nvim', config = true }, -- modern tagbar
    { "dstein64/vim-startuptime", cmd = "StartupTime" }, -- show startup time if needed
    { 'sindrets/diffview.nvim', -- diff view for git
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { "akinsho/toggleterm.nvim", -- terminal
        version = '*',
        config = function()
            require("toggleterm").setup{
              open_mapping = [[<c-\>]]
            }
        end,
    },
    {
      "folke/which-key.nvim", -- shows which key does what
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {}
    },

    -- --------------------------------------------------------------------------
    -- Search and other operations --
    -- --------------------------------------------------------------------------
    'dyng/ctrlsf.vim', -- bulk refactoring, edit several files at the time
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    },
    { 'windwp/nvim-spectre', -- find and replace
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = true,
    },

    -- --------------------------------------------------------------------------
    -- Git Integration --
    -- --------------------------------------------------------------------------
    'tpope/vim-fugitive', -- Git integration
    'tpope/vim-rhubarb', -- Fugitive extension for GBrowse
    'rhysd/git-messenger.vim', -- Commit preview for codelines
    { 'lewis6991/gitsigns.nvim', -- Git decorations
        version = '*',
        config = true,
    },

    -- --------------------------------------------------------------------------
    -- LSP , DAP, and Languages --
    -- --------------------------------------------------------------------------
    'neovim/nvim-lspconfig', -- LspConfig the configuration is  in the separate file
    "jose-elias-alvarez/null-ls.nvim", -- integrate formatters into LSP
    'lukas-reineke/format.nvim', -- wrapper to format code on save
    'jamessan/vim-gnupg', -- work with GPG encrypted files
    'martinda/Jenkinsfile-vim-syntax', -- recognises Jenkinsfile as Groovy
    'hashivim/vim-terraform', -- Terraform (legacy)
    'towolf/vim-helm',
    { 'williamboman/mason.nvim', config = true }, -- install LSP and DAP things
    { "williamboman/mason-lspconfig.nvim", -- LSP integration for Mason
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = true,
    },
    { "jayp0521/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
    { "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            'mfussenegger/nvim-dap', -- required by several plugins
        },
    },
    { "ray-x/lsp_signature.nvim", config = true }, -- method signature helper
    { 'kkharji/lspsaga.nvim', config = true }, -- useful LSP commands
    { 'j-hui/fidget.nvim', config = true, tag = "legacy" }, -- LSP loading spinner
    { 'hrsh7th/nvim-cmp', -- completion. Configuration is in another file
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'ray-x/cmp-treesitter',
        },
    },
    { 'dcampos/nvim-snippy', -- snippets
        dependencies = {
            'dcampos/cmp-snippy',
            'honza/vim-snippets',
        },
    },
    { 'rcarriga/nvim-dap-ui', -- UI for DAP
        dependencies = {
            'mfussenegger/nvim-dap', -- required by several plugins
        },
    },
    { 'leoluz/nvim-dap-go', -- DAP for Go (Delve)
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = true,
    },
    { 'theHamsta/nvim-dap-virtual-text', -- virtual text for DAP
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-treesitter/nvim-treesitter',
        },
        config = true,
    },
    { 'euclio/vim-markdown-composer', -- markdown preview
        build = "cargo build --release --locked",
    },
    { 'toppair/peek.nvim', -- markdown preview with mermaid
        build = 'deno task --quiet build:fast',
    },
    { 'nvim-treesitter/nvim-treesitter', -- treesitter
        build = ":TSUpdate",
    },
    { "ray-x/go.nvim", -- Go integration
        dependencies = {  -- optional packages
          "ray-x/guihua.lua",
          "neovim/nvim-lspconfig",
        },
        config = function()
          require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    { "folke/trouble.nvim", -- pretty list for LSP
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },
    { "ErichDonGubler/lsp_lines.nvim", -- show LSP messages in virtual text lines
        config = function()
            require("lsp_lines").setup()
        end,
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
