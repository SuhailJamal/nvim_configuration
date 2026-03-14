return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a", function() require("harpoon"):list():append() end, desc = "Add file to harpoon" },
        { "<C-e>", function() 
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list()) 
        end, desc = "Toggle harpoon quick menu" },
        { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Navigate to harpoon file 1" },
        { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Navigate to harpoon file 2" },
        { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Navigate to harpoon file 3" },
        { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Navigate to harpoon file 4" },
        { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Navigate to previous harpoon file" },
        { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Navigate to next harpoon file" },
    },
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

        -- Open harpoon in telescope
        vim.keymap.set("n", "<leader>th", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon in telescope" })
    end
}