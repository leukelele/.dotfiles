return {
    "echaya/neowiki.nvim",
    opts = {
        wiki_dirs = {
            { name = "notes", path = "~/notes" },
            { name = "gbemu", path = "~/documents/gh/gbemu/" },
        },
    },
    keys = {
        { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>",
            desc = "open wiki" },
        { "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>",
            desc = "open wiki in floating window" },
        { "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>",
            desc = "open wiki in tab" },
    },
}
