return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
        local jdtls = require("jdtls")
        local home = os.getenv("USERPROFILE") or os.getenv("HOME")
        local workspace_path = home .. "/.cache/jdtls-workspace/"
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = workspace_path .. project_name

        local config = {
            cmd = {
                "jdtls",
                "-data", workspace_dir
            },
            root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            -- Add your JDKs here if needed
                        }
                    }
                }
            }
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                jdtls.start_or_attach(config)
                
                -- Java-specific keymaps
                local opts = { buffer = true }
                vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, { desc = "Organize Imports", buffer = true })
                vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, { desc = "Extract Variable", buffer = true })
                vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, { desc = "Extract Constant", buffer = true })
                vim.keymap.set("v", "<leader>jm", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], { desc = "Extract Method", buffer = true })
            end
        })
    end
}
