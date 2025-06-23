-- auto-complete
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		-- add snippet or lsp sources as needed:
		-- "hrsh7th/cmp-path",
		-- "hrsh7th/cmp-vsnip",
		-- "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
	},
	opts = function(_, opts)
		-- You can modify defaults here
		-- e.g., add new sources:
		-- table.insert(opts.sources, { name = "path" })
		-- Customize buffer source:
		-- opts.sources[2].keyword_length = 5
	end,
	config = function(_, opts)
		local cmp = require("cmp")

		-- call setup with your opts table
		cmp.setup(vim.tbl_deep_extend("force", {
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
					-- for luasnip users: require('luasnip').lsp_expand(args.body)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			}),
		}, opts))
	end, 
}
