return {
    "nvim-tree/nvim-tree.lua",
    cmd = {
        "NvimTreeToggle",
        "NvimTreeFindFile",
        "NvimTreeOpen",
        "NvimTreeFocus",
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>f", "<cmd>NvimTreeToggle<cr>",
            desc = "toggle file tree" },
        { "<leader>ef", "<cmd>NvimTreeFindFile<cr>",
            desc = "find current file in tree" },
    },
    opts = {
        filters = {
            dotfiles = false,
        },
    },
}
