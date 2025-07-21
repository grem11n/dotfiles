-- LSP integration for Mason
return { "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    -- list of servers for mason to install
    ensure_installed = {
      "bashls", -- Bash
      "docker_compose_language_service", -- Docker Compose
      "dockerls", -- Dockerfile
      "eslint", -- Javascript/Typescript
      "golangci_lint_ls", -- Go
      "gopls", -- Go
      "graphql", -- GraphQL
      "helm_ls", -- Helm
      --"jedi_language_server", -- Python
      "jsonls", -- JSON
      "lua_ls", -- LUA
      "marksman", -- Markdown
      "pyright", -- Python
      "ruff", -- Python
      "taplo", -- TOML
      "terraformls", -- Terraform
      "ts_ls", -- Typescript
      "yamlls", -- YAML
      -- "groovyls", -- Groovy
      -- "jqls", -- JQ
      -- "ruby_ls", -- Ruby
      -- "pylsp", -- Python
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
  },
}
