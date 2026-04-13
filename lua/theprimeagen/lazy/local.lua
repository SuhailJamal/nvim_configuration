return {
    -- nvim-autopairs: lazy-load on insert mode only
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true, -- use treesitter to avoid pairing inside strings/comments
        },
    },

    -- Comment.nvim: lazy-load on keys (Neovim 0.10+ has native commenting,
    -- but Comment.nvim still handles jsx/tsx comment strings better via treesitter)
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gc", mode = { "n", "v" }, desc = "Toggle comment (linewise)" },
            { "gb", mode = { "n", "v" }, desc = "Toggle comment (blockwise)" },
        },
        opts = {},
    },
}
