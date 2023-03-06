# Migration to LUA TODO

- [x] Move plugins from vim-plug to Lazy
- [x] Fix `Rg` command (convert to fzf.lua) <-- fixes with <C-g> workaround
- [x] Remove Goyo-related things from configs
- [ ] Figure out a keymap or command for :TZAtraxis
- [x] Figure out if old FZF plugins and lspfuzzy are required
- [x] Remove code related to the old 'junegunn/fzf' plugin
- [ ] Figure out if it's possible to lazy-load IndentBlankLines plugin on its commands
- [ ] Figure out dots for IndentBlankLines commands
- [x] Figure out how to onboard markdown composer to lazy
- [x] Figure out, which plugins can Telescope replace:
    - `stsewd/fzf-checkout.vim`
- [ ] Nvim 0.9 has built-in Editorconfig integration, so need to make sure to configure that natively
- [ ] Split `lazy.lua` file into multiple smaller files
- [x] Install only required Treesitter languages
- [ ] Remove remaining vimscript
- [x] Check which formatter to use
