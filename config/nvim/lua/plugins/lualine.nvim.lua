-- statusline
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local c = {
            bg        = '#1F1F23',
            black     = '#1B1B1B',
            skyblue   = '#50B0F0',
            cyan      = '#009090',
            fg        = '#D0D0D0',
            green     = '#60A040',
            oceanblue = '#0066cc',
            orange    = '#FF9000',
            red       = '#D10000',
            violet    = '#9E93E8',
            white     = '#FFFFFF',
            yellow    = '#E1E120',
        }

        local theme = {
            normal = {
                a = { fg = c.black, bg = c.skyblue,   gui = 'bold' },
                b = { fg = c.white, bg = c.oceanblue, gui = 'bold' },
                c = { fg = c.fg,    bg = c.bg },
                x = { fg = c.fg,    bg = c.bg },
                y = { fg = c.white, bg = c.oceanblue, gui = 'bold' },
                z = { fg = c.black, bg = c.skyblue,   gui = 'bold' },
            },
            insert = {
                a = { fg = c.black, bg = c.green,  gui = 'bold' },
                z = { fg = c.black, bg = c.green,  gui = 'bold' },
            },
            visual = {
                a = { fg = c.black, bg = c.violet, gui = 'bold' },
                z = { fg = c.black, bg = c.violet, gui = 'bold' },
            },
            replace = {
                a = { fg = c.black, bg = c.red,    gui = 'bold' },
                z = { fg = c.black, bg = c.red,    gui = 'bold' },
            },
            command = {
                a = { fg = c.black, bg = c.yellow, gui = 'bold' },
                z = { fg = c.black, bg = c.yellow, gui = 'bold' },
            },
            inactive = {
                a = { fg = c.white, bg = c.oceanblue, gui = 'bold' },
                b = { fg = c.fg,    bg = c.bg },
                c = { fg = c.fg,    bg = c.bg },
            },
        }

        require('lualine').setup({
            options = {
                theme                = theme,
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
