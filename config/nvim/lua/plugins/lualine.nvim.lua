-- statusline
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- palette for diff / diagnostics component colors
        local c = {
            cyan    = '#009090',
            green   = '#60A040',
            orange  = '#FF9000',
            red     = '#D10000',
            skyblue = '#50B0F0',
            yellow  = '#E1E120',
        }

        require('lualine').setup({
            options = {
                theme                = 'ayu',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus         = false,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    { 'branch', icon = '' },
                    {
                        'diff',
                        symbols = { added = ' +', modified = ' ~', removed = ' -' },
                        diff_color = {
                            added    = { fg = c.green },
                            modified = { fg = c.orange },
                            removed  = { fg = c.red },
                        },
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        symbols = { error = 'E-', warn = 'W-', hint = 'H-', info = 'I-' },
                        diagnostics_color = {
                            error = { fg = c.red },
                            warn  = { fg = c.yellow },
                            hint  = { fg = c.cyan },
                            info  = { fg = c.skyblue },
                        },
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        path    = 0,
                        symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' },
                    },
                    { 'filesize' },
                },
                lualine_x = {
                    { 'encoding' },
                    { 'fileformat' },
                    { 'filetype' },
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = { { 'filetype', colored = false } },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
