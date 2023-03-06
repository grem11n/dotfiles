-- Neovide
if vim.fn.exists('g:neovide') == 1 then
    vim.g.neovide_input_use_logo = 1
    vim.g.neovide_cursor_trail_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.cmd('runtime neovide.vim')
end
