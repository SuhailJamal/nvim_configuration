return {
    "nvim-lualine/lualine.nvim",
    -- no nvim-web-devicons dep needed since icons_enabled = false
    event = "VeryLazy",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                section_separators = "",
                component_separators = "",
                icons_enabled = false,
                globalstatus = true, -- single statusline instead of one per window
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { { "filename", path = 1 } }, -- show relative path
                lualine_x = { "diagnostics", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                -- globalstatus = true makes inactive sections unused, keep empty
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}