return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,

  -- obsidian.nvim will only work in the vault's directory
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre " .. vim.fn.expand "~" .. "/.nb/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/.nb/**.md",
  },

  -- I think I prefer that there is a persistent theme among my plugins
  keys = {
    { "<leader>kn", mode = "n", "<cmd>ObsidianNew<cr>", desc = "Creates new Obsidian note" },
    { "<leader>km", mode = "n", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian Notes" },
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

    -- note titles are time-based
    note_id_func = function(title)
      local timestamp = os.date("%y%m%d%H%M")
      return timestamp
    end,

    workspaces = {
      {
        name = "notebook",
        path = "~/.nb/",
      },
    },

    -- functionality for opening files 
    follow_url_func = function(url)
      print("Opening URL: " .. url)
      vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
  
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
  },
}
