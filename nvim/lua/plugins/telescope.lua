return {
	'nvim-telescope/telescope.nvim', 
	branch = '0.1.x',
	lazy = true,
	cmd = {"Telescope"},
	dependencies = { 'nvim-lua/plenary.nvim', 'Burntsushi/ripgrep' },

	keys = {
		{ "<leader>dv", mode = "n", "<cmd>Telescope find_files<cr>", 
		  desc = "Find Files" },
		{ "<leader>dc", mode = "n", "<cmd>Telescope live_grep<cr>", 
		  desc = "Live grep" },
	},

	opts = {
		defaults = {
			vimgrep_arguments = {
				-- preserve ripgrep's defaults but include hidden files
				unpack(require('telescope.config').values.vimgrep_arguments),
				"--hidden",
				"--glob", "!**/.git/*",
			},
			mappings = {
				i = { ["<esc>"] = require("telescope.actions").close },
			},
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", 
				"!**/.git/*" },
			},
		},
	},
}
