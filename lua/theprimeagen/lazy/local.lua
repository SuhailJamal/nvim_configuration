local local_plugins = {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    }
}

return local_plugins
