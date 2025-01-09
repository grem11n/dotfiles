-- integrtion of null-ls into Mason
return { "jayp0521/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  opts = {
	-- list of formatters & linters for mason to install
	ensure_installed = {
      "black",
      "jq",
      "luaformatter",
      "markdownlint",
      "prettierd", -- Javascript/Typescript
      "pylint",
      "rubocop",
      "shellcheck", -- Bash
      "shellharden", -- Bash
      "shfmt", -- Bash
      "stylua",
      "yamlfmt",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
  },
}
