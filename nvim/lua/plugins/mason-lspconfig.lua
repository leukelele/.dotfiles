local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = "williamboman/mason.nvim",
	event = "BufReadPre",
	opts = {
		ensure_installed = { "clangd", "lua_ls", "marksman" },
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
		},
	},
}
