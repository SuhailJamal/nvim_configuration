return {
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        keys = {
            {
                "<leader>tt",
                "<cmd>Trouble diagnostics toggle<CR>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>tT",
                "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
                desc = "Buffer diagnostics (Trouble)",
            },
            {
                "[t",
                function()
                    require("trouble").prev({ skip_groups = true, jump = true })
                end,
                desc = "Previous trouble item",
            },
            {
                "]t",
                function()
                    require("trouble").next({ skip_groups = true, jump = true })
                end,
                desc = "Next trouble item",
            },
        },
        opts = {
            icons = false,
            -- v3 defaults are sane; only override what you need
        },
    },
}
