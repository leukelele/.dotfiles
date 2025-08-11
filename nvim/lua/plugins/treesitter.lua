-- parser generator and incremental parsing library; may need to reconfigure
-- if ever encounter large files
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = {
                "c", "lua", "markdown", "markdown_inline", "vim", "vimdoc",
                "comment", "bash"
            },
            highlight = { enable = true },
        })
    end,
}
