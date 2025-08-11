local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    event = "BufReadPre",
    opts = {
        ensure_installed = { "clangd", },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        },
    },
}
