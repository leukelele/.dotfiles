return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>jf", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<leader>jd", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
        { "<leader>jb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
        { "<leader>jh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
    },
    opts = function()
        local actions = require("telescope.actions")

        return {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            },
        }
    end,
}
