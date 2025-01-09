require('config.core.base')
require('config.core.keymaps')
require('config.lazy') -- install all the plugins
require('config.core.appearance')

-- Configurations from separate configs
require('config.plugins.cmp')
require('config.plugins.go')
require('config.plugins.lsp')

-- gui
require('config.gui.neovide')
