return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        
        -- Use .setup() instead of :setup() to prevent Harpoon v1 from 
        -- accidentally merging the module into the config, which causes 
        -- JSON serialization errors.
        harpoon.setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        -- For Harpoon2 compatibility, we use the object returned by require("harpoon")
        -- If it's Harpoon2, :list() will work. If it's v1, we'll handle it gracefully.
        local function is_harpoon2()
            return harpoon.list ~= nil
        end

        if is_harpoon2() then
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        else
            -- Harpoon v1 fallback
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
        end
    end
}