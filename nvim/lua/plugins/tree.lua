-- file tree
return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFindFile" },  -- lazy-load on commands
	config = function()
		-- disable netrw in favor of nvim-tree
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
			},
		})
	end,
}
