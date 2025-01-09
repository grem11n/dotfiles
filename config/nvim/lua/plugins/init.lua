return {
    --{
    --  "NeogitOrg/neogit",
    --  dependencies = {
    --    "nvim-lua/plenary.nvim",         -- required
    --    "sindrets/diffview.nvim",        -- optional
    --    "ibhagwan/fzf-lua",              -- optional
    --  },
    --  config = true
    --},
    "hashivim/vim-terraform", -- Terraform (legacy)
    { "hrsh7th/nvim-cmp", -- completion. Configuration is in another file
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "ray-x/cmp-treesitter",
        },
    },
    --{ "euclio/vim-markdown-composer", -- markdown preview
    --    build = "cargo build --release --locked",
    --},
    --{ "ErichDonGubler/lsp_lines.nvim", -- show LSP messages in virtual text lines
    --    config = function()
    --        require("lsp_lines").setup()
    --    end,
    --},
}
