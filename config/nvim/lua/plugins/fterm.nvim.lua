-- terminal in a floating window
return { "numToStr/FTerm.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>t",
            function()
                require("FTerm").toggle()
            end,
            desc = "Open floating terminal",
        },
    },
}
