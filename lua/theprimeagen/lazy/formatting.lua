return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua        = { "stylua" },
            python     = { "isort", "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css      = { "prettier" },
            html     = { "prettier" },
            json     = { "prettier" },
            yaml     = { "prettier" },
            markdown = { "prettier" },
            graphql  = { "prettier" },
            c        = { "clang_format" },
            cpp      = { "clang_format" },
            rust     = { "rustfmt" },
            sh       = { "shfmt" },
            bash     = { "shfmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback", -- replaces deprecated lsp_fallback = true
        },
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}