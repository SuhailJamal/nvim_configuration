return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    -- Treesitter parsers are needed as soon as a buffer opens
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        -- The new nvim-treesitter main branch (for Neovim 0.11+) removed the
        -- old `nvim-treesitter.configs` module entirely. Highlighting, folding,
        -- and indent are now handled natively by Neovim's built-in treesitter
        -- integration (vim.treesitter). The plugin's role is now ONLY parser
        -- management (:TSInstall / :TSUpdate).
        --
        -- setup() here only accepts { install_dir = "..." } — nothing else.
        require("nvim-treesitter").setup()

        -- Install missing parsers after startup (non-blocking).
        -- Requires the `tree-sitter` CLI on PATH (installed via npm).
        vim.schedule(function()
            local ok, install = pcall(require, "nvim-treesitter.install")
            if not ok then return end

            local wanted = {
                "vimdoc", "javascript", "typescript", "tsx",
                "c", "lua", "rust", "python",
                "html", "css", "json", "yaml",
                "jsdoc", "bash", "markdown", "markdown_inline",
            }

            -- Only install parsers that are not already present
            local installed = require("nvim-treesitter").get_installed()
            local installed_set = {}
            for _, p in ipairs(installed) do installed_set[p] = true end

            local missing = {}
            for _, p in ipairs(wanted) do
                if not installed_set[p] then
                    table.insert(missing, p)
                end
            end

            if #missing > 0 then
                install.install(missing)
            end
        end)

        -- ── Neovim-native treesitter features ────────────────────────────────

        -- Indentation: use treesitter expr for smarter indent
        -- (vim.indentexpr from nvim-treesitter still works)
        vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- Folding: treesitter-based (folds start open so files aren't collapsed)
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr  = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldenable = false

        -- Large-file guard: disable treesitter highlighting for files > 100 KB
        -- by hooking into FileType and checking size before highlight starts.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local max = 100 * 1024
                local ok2, stat = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
                if ok2 and stat and stat.size > max then
                    vim.treesitter.stop(ev.buf)
                end
            end,
        })

        -- Register templ as a filetype for treesitter
        -- (parser must be installed separately via :TSInstall templ)
        vim.treesitter.language.register("templ", "templ")
    end,
}
