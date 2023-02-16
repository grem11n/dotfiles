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

require("lazy").setup({
    { "catppuccin/nvim", -- main colorscheme
        name = "catppuccin",
        priority = 1000, -- make sure to load it first
        opts = {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "macchiato",
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
        end,
    },
    "RRethy/vim-illuminate", -- highlight functon under cursor after certain time
    { "ntpeters/vim-better-whitespace", -- highlight trailing whitespaces
      config = function()
          vim.cmd.highlight({ "ExtraWhitespace", "ctermbg=red", "guibg=red" })
      end,
    },
    { "akinsho/bufferline.nvim", -- bufferline
        version = "v3.*",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = true,
    },
    { "feline-nvim/feline.nvim", -- statusline
        config = true,
    },
    { "Pocco81/true-zen.nvim", -- focus mode
        dependencies = {
            "folke/twilight.nvim",
        },
	    config = function()
            require("true-zen").setup {
               integrations = {
                   twilight = true, -- enable twilight (ataraxis)
               },
            }
        end,
    },
    'jamessan/vim-gnupg', -- work with GPG encrypted files
    'dyng/ctrlsf.vim', -- bulk refactoring
    'junegunn/vim-peekaboo', -- preview of tre copy buffers
    'yaronkh/vim-winmanip', -- move open splits around
    { 'goolord/alpha-nvim', -- startup page
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },
    { 'lukas-reineke/indent-blankline.nvim', -- indent lines
        opts = {
            enabled = false,
            char_list = {'|', '¦', '┆', '┊'},
            space_char_blankline = " ",
        },
        config = function(_, opts)
            require("indent_blankline").setup(opts)
        end,
    },
    { 'nvim-telescope/telescope.nvim', -- nvim telescpe
        tag = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim'},
    },
    { 'EtiamNullam/deferred-clipboard.nvim', -- get system clipboard to nvim
        opts = { lazy = true, },
        config = true,
    },
    'famiu/bufdelete.nvim',
    { 'sindrets/diffview.nvim', -- diff view for git
        dependencies = 'nvim-lua/plenary.nvim',
    },
    { 'windwp/nvim-spectre', -- find and replace
        dependencies = 'nvim-lua/plenary.nvim',
        config = true,
    },
    { 'euclio/vim-markdown-composer', -- markdown preview
        build = "cargo build --release --locked",
    },
    { "akinsho/toggleterm.nvim", -- terminal
        version = '*',
        config = function()
            require("toggleterm").setup{
              open_mapping = [[<c-\>]]
            }
        end,
    },
    'tpope/vim-fugitive', -- Git integration
    'tpope/vim-rhubarb', -- Fugitive extension for GBrowse
    { 'lewis6991/gitsigns.nvim', -- Git decorations
        version = '*',
        config = true,
    },
    'rhysd/git-messenger.vim', -- Commit preview for codelines
    { "nvim-neo-tree/neo-tree.nvim", -- directory tree
        cmd = "NeoTreeRevealToggle",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup {
              filesystem = {
                hijack_netrw_behavior = "disabled",
                filtered_items = { --These filters are applied to both browsing and searching
                  hide_dotfiles = false,
                  hide_gitignored = false,
                },
              }
            }
        end,
    },
    { 'nvim-treesitter/nvim-treesitter', -- treesitter
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "diff", "gitcommit", "gitignore", "go", "gomod", "gosum", "hcl", "json", "make", "markdown", "mermaid", "python", "regex", "rego", "terraform", "toml", "yaml" },
            sync_install = false,
            ignore_install = { "phpdoc", "dockerfile" },
            highlight = {
              enable = false,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    { 'lukas-reineke/format.nvim', -- wrapper to format code on save
        opts = {
            ["*"] = {
                {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
            },
            vim = {
                {
                    cmd = {"luafmt -w replace"},
                    start_pattern = "^lua << EOF$",
                    end_pattern = "^EOF$"
                }
            },
            vimwiki = {
                {
                    cmd = {"prettier -w --parser babel"},
                    start_pattern = "^{{{javascript$",
                    end_pattern = "^}}}$"
                }
            },
            lua = {
                {
                    cmd = {
                        function(file)
                            return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
                        end
                    }
                }
            },
            markdown = {
                {cmd = {"prettier -w"}},
                {
                    cmd = {"black"},
                    start_pattern = "^```python$",
                    end_pattern = "^```$",
                    target = "current"
                }
            },
        },
        config = function(_, opts)
            require("lsp-format").setup(opts)
        end,
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
    'hashivim/vim-terraform', -- not sure if I need it
    'martinda/Jenkinsfile-vim-syntax', -- recognises Jenkinsfile as Groovy
    'towolf/vim-helm',
    { 'williamboman/mason.nvim', -- install LSP and DAP things
        config = true,
    },
    { "williamboman/mason-lspconfig.nvim", -- LSP integration for Mason
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = true,
    },
    'neovim/nvim-lspconfig', -- LspConfig the configuration is  in the separate file
    { 'tami5/lspsaga.nvim', -- useful LSP commands
        config = true,
    },
    { 'j-hui/fidget.nvim', -- LSP loading spinner
        config = true,
    },
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
    { 'ibhagwan/fzf-lua', -- FZF in LUA
    dependencies = { 'nvim-tree/nvim-web-devicons',
    }
    },
    { 'simrat39/symbols-outline.nvim', -- modern tagbar
        config = true,
    },
    {
      "dstein64/vim-startuptime", -- show startup time if needed
      cmd = "StartupTime",
    },
    'vim-voom/VOoM', -- not sure if I will ever use it
    'AndrewRadev/splitjoin.vim', -- swap between one-liner and multiline with gJ and gS
    { "folke/trouble.nvim", -- pretty list for LSP
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },
})
