return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    -- restore the session for the current directory
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    -- restore the last session
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    -- stop Persistence => session won't be saved on exit
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Session" },
  },
}
