require('config.core.base')
require('config.lazy') -- install all the plugins
require('config.core.appearance')
require('config.core.keymaps')

-- Configurations from separate configs
require('config.plugins.cmp')
require('config.plugins.format')
require('config.plugins.go')
require('config.plugins.indent-blankline')
require('config.plugins.lsp')
require('config.plugins.mason')
require('config.plugins.neo-tree')
require('config.plugins.snippy')
require('config.plugins.treesitter')
require('config.plugins.true-zen')
--require('config.plugins.telescope')
require('config.plugins.peek-nvim')

-- gui
require('config.gui.neovide')
