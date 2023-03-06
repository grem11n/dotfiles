require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "diff",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "hcl",
        "json",
        "make",
        "markdown",
        "mermaid",
        "python",
        "regex",
        "rego",
        "terraform",
        "toml",
        "yaml",
    },
    sync_install = false,
    ignore_install = {
        "phpdoc",
        -- "dockerfile"
    },
    highlight = {
      enable = false,
    },
})
