-- Ayu colorscheme
return {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000, -- load before lualine so lualine builds its hl groups after `hi clear`
    config = function()
        require('ayu').setup({
            mirage = true,
            overrides = {},
        })
        require('ayu').colorscheme()
    end,
}
