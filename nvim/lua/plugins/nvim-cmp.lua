-- auto-complete
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",

        -- add snippet or lsp sources as needed:
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        -- "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
    },
    config = function(_, opts)
        local cmp = require("cmp")

        -- call setup with your opts table
        cmp.setup(vim.tbl_deep_extend("force", {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                    --for luasnip users: require('luasnip').lsp_expand(
                        --args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local maxwidth = 50
                    local ellipsis_char = "…"
                    if vim.fn.strchars(vim_item.abbr) > maxwidth then
                        vim_item.abbr = vim.fn.strcharpart(
                            vim_item.abbr, 0, maxwidth) .. ellipsis_char
                    end
                    vim_item.menu = ({
                        nvim_lsp = "LSP",
                        buffer = "Buf",
                        path = "Path",
                        vsnip = "Snippet",
                    })[entry.source.name]

                    return vim_item
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
                -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = "lazydev", group_index = 0 },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "vsnip" },
                { name = "buffer" },
            }),
        }, opts or {}))
    end,
}
