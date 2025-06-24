-- obsidian
local vault = vim.fn.expand("~/.nb")

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,

	-- obsidian.nvim will only work in the vault's directory
	event = {
		"BufReadPre " .. vault .. "/**.md",
		"BufNewFile " .. vault .. "/**.md",
	},

	keys = {
		{ "<leader>kn", mode = "n", "<cmd>ObsidianNew<cr>", 
		  desc = "Creates new note" },
		{ "<leader>km", mode = "n", "<cmd>ObsidianSearch<cr>", 
		  desc = "Search notes" },
	},

	dependencies = {
		"hrsh7th/nvim-cmp",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
		"3rd/image.nvim",
	},

	opts = {
		notes_subdir = "fleeting/",
		new_notes_location = "notes_subdir",
		disable_frontmatter = true,
		workspaces = {
			{ name = "notebook", path = vault },
		},

		-- note titles are time-based
		note_id_func = function(title)
			return os.date("%y%m%d%H%M")
		end,

		-- functionality for opening links
		follow_url_func = function(url)
			print("Opening: " .. url)
			vim.fn.jobstart({ "xdg-open", url })
		end,
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	},
}
