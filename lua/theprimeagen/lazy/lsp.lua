return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        {
            "L3MON4D3/LuaSnip",
            build = nil,
            version = "v2.*",
        },
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "rafamadriz/friendly-snippets",
    },

    config = function()
        -- ── LuaSnip ──────────────────────────────────────────────────────────
        local ls = require("luasnip")
        ls.filetype_extend("javascript", { "jsdoc" })

        vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        require("luasnip.loaders.from_vscode").lazy_load()

        -- ── Capabilities (shared across all servers) ──────────────────────────
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- ── Server configurations (mason-lspconfig v2: use vim.lsp.config) ───
        --
        -- vim.lsp.config sets defaults for a server; mason-lspconfig v2 will
        -- automatically call vim.lsp.enable() for every installed server.

        -- Default capabilities for all servers not explicitly configured below
        vim.lsp.config("*", { capabilities = capabilities })

        -- lua_ls: recognise vim globals
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    },
                },
            },
        })

        -- rust_analyzer: use clippy for richer lints
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    check = { command = "clippy" },
                },
            },
        })

        -- yamlls: enable schema store for auto-detection
        vim.lsp.config("yamlls", {
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemaStore = { enable = true, url = "" },
                },
            },
        })

        -- ── Mason + mason-lspconfig v2 ────────────────────────────────────────
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "clangd",
                "pyright",
                "html",
                "cssls",
                "jsonls",
                "tailwindcss",
                "rust_analyzer",
                "bashls",
                "yamlls",
                "marksman",
            },
            -- automatic_enable = true is the default in v2; it calls
            -- vim.lsp.enable() for every installed server automatically.
        })

        -- ── Diagnostics ───────────────────────────────────────────────────────
        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = " ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
                format = function(diagnostic)
                    return string.format(
                        "%s (%s)",
                        diagnostic.message,
                        diagnostic.source
                    )
                end,
            },
        })

        -- ── nvim-cmp ──────────────────────────────────────────────────────────
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-i>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })

        -- ── cmdline completions ───────────────────────────────────────────────

        -- `/` and `?` search: complete from buffer words
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- `:` command mode: complete paths and Ex commands
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            -- Don't complete built-in commands that don't make sense in a menu
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
