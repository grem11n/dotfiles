-- Neovide
if vim.fn.exists('g:neovide') == 1 then
    vim.g.neovide_input_use_logo = 1
    vim.g.neovide_cursor_trail_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.cmd('runtime neovide.vim')
    vim.keymap.set({ 'i', 'n' }, '<D-a>', '<ESC>ggVG')                              -- select all
    vim.keymap.set({ 'i', 'n' }, '<D-w>', function() close_tab() end)               -- close tab
    vim.keymap.set({ 'i', 'n' }, '<D-[>', function() vim.cmd('BufferPrevious') end) -- previous tab
    vim.keymap.set({ 'i', 'n' }, '<D-]>', function() vim.cmd('BufferNext') end)     -- next tab
    vim.keymap.set('i', '<D-t>', '<C-o>:tabnew<CR><ESC>')                           -- new tab (insert)
    vim.keymap.set('n', '<D-t>', ':tabnew<CR>')                                     -- new tab (insert)
    vim.keymap.set('i', '<D-s>', '<C-o>:w<CR>')                                     -- save (insert)
    vim.keymap.set('n', '<D-s>', ':w<CR>')                                          -- save (normal)
    vim.keymap.set('x', '<D-x>', '"+d')                                             -- cut
    vim.keymap.set('x', '<D-c>', '"+y')                                             -- copy
    vim.keymap.set('i', '<D-v>', '<C-r><C-o>+')                                     -- paste (insert)
    vim.keymap.set('n', '<D-v>', 'i<C-r><C-o>+<ESC>l')                              -- paste (normal)
    vim.keymap.set('x', '<D-v>', '"+P')                                             -- paste (visual)
    vim.keymap.set('c', '<D-v>', '<C-r>+')                                          -- paste (command)
    -- vim.keymap.set('n', '<D-q>', ':q<CR>')                                          -- quit
end
