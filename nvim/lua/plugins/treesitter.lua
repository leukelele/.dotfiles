-- parser generator and incremental parsing library; may need to reconfigure
-- if ever encounter large files
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local ts = require("nvim-treesitter")

        ts.setup()

        ts.install({
            "c",
            "cpp",
            "lua",
            "markdown",
            "markdown_inline",
            "vim",
            "vimdoc",
            "comment",
            "bash",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
