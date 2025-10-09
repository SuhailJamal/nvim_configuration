return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        
        -- REQUIRED
        harpoon:setup()
        
        -- Basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end,
            { desc = "Add file to harpoon" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Toggle harpoon quick menu" })

        -- Nav keymaps
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
            { desc = "Navigate to harpoon file 1" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end,
            { desc = "Navigate to harpoon file 2" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end,
            { desc = "Navigate to harpoon file 3" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end,
            { desc = "Navigate to harpoon file 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end,
            { desc = "Navigate to previous harpoon file" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,
            { desc = "Navigate to next harpoon file" })

        -- Open harpoon in telescope
        vim.keymap.set("n", "<leader>th", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon in telescope" })
    end
}