-- set runtimepath
vim.api.nvim_command('set runtimepath^=~/.config/nvim')
vim.api.nvim_command('let &packpath = &runtimepath')

-- Vim options
vim.opt.foldenable = false -- somehow this improves performance a lot
vim.opt.wildignorecase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt_local.updatetime = 300
vim.opt.completeopt = {
    menuone = true,
    noinsert = true,
    noselect = true
}
vim.opt.shortmess:append({ c = true })
vim.opt.termguicolors = true
-- Configuration for Backspace key
vim.opt.backspace = { "start", "eol", "indent" }

-- For set list
vim.opt.listchars:append "space:⋅"

-- Do not autostart Markdown composer
vim.g.markdown_composer_autostart = 0

-- Format TF files on save
vim.g.terraform_fmt_on_save = 1

--- Env for Python
vim.g.python3_host_prog = os.getenv("HOME") .. ".pyenv/versions/3.11.8/envs/nvim/bin/python"
