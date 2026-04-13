return {
    -- refactoring.nvim: lazy-load on its commands only
    {
        "theprimeagen/refactoring.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
        cmd = { "Refactor" },
        keys = {
            { "<leader>ri", ":Refactor inline_variable<CR>",  mode = { "n", "v" }, desc = "Inline variable" },
            { "<leader>re", ":Refactor extract_var<CR>",      mode = "v",          desc = "Extract variable" },
            { "<leader>rr", ":Refactor extract_function<CR>", mode = "v",          desc = "Extract function" },
        },
        opts = {},
    },
}
