return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "clangd",
        },

        -- mason-lspconfig v2 enables installed servers with vim.lsp.enable()
        -- by default, but keeping this explicit makes the behavior clear.
        automatic_enable = true,
    },
    config = function(_, opts)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("clangd", {
            capabilities = capabilities,
        })

        require("mason-lspconfig").setup(opts)
    end,
}
