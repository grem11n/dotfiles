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
    { "Shatur/neovim-ayu", name = "ayu", priority = 1000 }, -- colorscheme
    { "freddiehaddad/feline.nvim", config = true }, -- statusline
    { "akinsho/bufferline.nvim", -- bufferline
        version = "v4.*",
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
    { 'folke/zen-mode.nvim' }, -- focus mode
    { "nvim-neo-tree/neo-tree.nvim", -- directory tree
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
      'stevearc/oil.nvim',
      opts = {
          default_file_explorer = false,
      },
      setup = true,
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "mikavilpas/yazi.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      event = "VeryLazy",
      keys = {
        -- 👇 in this section, choose your own keymappings!
        {
          "<leader>-",
          function()
            require("yazi").yazi()
          end,
          desc = "Open the file manager",
        },
      },
      ---@type YaziConfig
      opts = {
        open_for_directories = false,
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
    { "numToStr/FTerm.nvim", -- terminal
        event = "VeryLazy",
        keys = {
            {
                "<leader>t",
                function()
                    require("FTerm").toggle()
                end,
                desc = "Open floating terminal",
            },
        },
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
    {
      "folke/todo-comments.nvim", -- show TODO comments in a single view
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    'AndrewRadev/linediff.vim', -- show diff between code blocks
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
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'MagicDuck/grug-far.nvim', -- search and replace
      config = function()
        require('grug-far').setup({});
      end
    },
    {
      "otavioschwanck/arrow.nvim",
      opts = {
        show_icons = true,
        leader_key = ';', -- Recommended to be a single key
        buffer_leader_key = 'm', -- Per Buffer Mappings
      }
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
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = true
    },
    {
        "kdheepak/lazygit.nvim",
    	cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
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
    { 'nvimdev/lspsaga.nvim', -- useful LSP commands
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
    },
    { 'j-hui/fidget.nvim', config = true }, -- LSP loading spinner
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
    --{ "ErichDonGubler/lsp_lines.nvim", -- show LSP messages in virtual text lines
    --    config = function()
    --        require("lsp_lines").setup()
    --    end,
    --},
    { 'linux-cultist/venv-selector.nvim', -- select Python venv
      dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
      branch = "regexp",
      opts = {},
      event = 'VeryLazy',
    },
    { "github/copilot.vim" }, -- copilot
    {
      {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
          { "github/copilot.vim" }, -- or github/copilot.vim
          { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        config = true,
      },
    },
    -- --------------------------------------------------------------------------
    -- Misc --
    -- --------------------------------------------------------------------------
    {
      "epwalsh/obsidian.nvim",
      version = "*",  -- recommended, use latest release instead of latest commit
      lazy = true,
      ft = "markdown",
      event = {
        "BufReadPre /Users/yrochniak/Documents/Obsidian/Preply/**.md",
        "BufNewFile /Users/yrochniak/Documents/Obsidian/Preply/**.md",
      },
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {
        workspaces = {
          {
            name = "preply",
            path = "~/Documents/Obsidian/Preply",
          },
        },
      },
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
