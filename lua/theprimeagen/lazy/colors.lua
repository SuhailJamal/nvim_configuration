-- Inline, no global leak
local function set_transparent_bg()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,    -- colorscheme must load at startup
        priority = 1000, -- load before everything else
        config = function()
            require("rose-pine").setup({
                disable_background = true,
            })
            vim.cmd("colorscheme rose-pine")
            set_transparent_bg()
        end,
    },
}
