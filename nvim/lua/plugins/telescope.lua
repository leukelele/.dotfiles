return {
  'nvim-telescope/telescope.nvim', tag = '*',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>dv", mode = "n", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>dc", mode = "n", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
}
