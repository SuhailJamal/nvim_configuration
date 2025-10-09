return {
    -- Essential plugins
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').setup({})
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>pws', function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set('n', '<leader>pWs', function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        end
    },

    -- Colorschemes
    { "folke/tokyonight.nvim" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    },

    -- Diagnostics and errors
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    { "nvim-treesitter/playground" },

    -- Development tools
    { "theprimeagen/vim-be-good" },
    { "theprimeagen/refactoring.nvim" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },

    -- LSP and completion
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        }
    },

    -- Additional utilities
    { "folke/zen-mode.nvim" },
    -- { "github/copilot.vim" },  -- Uncomment if needed
    { "eandrju/cellular-automaton.nvim" },
    { "laytan/cloak.nvim" }
}

