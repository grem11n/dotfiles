-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- import mason-nvim-dap plugin safely
local mason_dap_status, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
        "bashls", -- Bash
        "docker_compose_language_service", -- Docker Compose
        "dockerls", -- Dockerfile
        "golangci_lint_ls", -- Go
        "gopls", -- Go
        "groovyls", -- Groovy
        "helm_ls", -- Helm
        -- "jqls", -- JQ
        "jsonls", -- JSON
        "lua_ls", -- LUA
        "pylsp", -- Python
        "ruby_ls", -- Ruby
        "taplo", -- TOML
        "terraformls", -- Terraform
        "yamlls", -- YAML
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
        "black",
        "jq",
        "luaformatter",
        "markdownlint",
        "pylint",
        "rubocop",
        "stylua",
        "yamlfmt",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

mason_dap.setup({
    -- list of debug adapters to install
    ensure_installed = {
        "bash-debug-adapter",
        "delve",
    },
	automatic_installation = true,
})
