return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim', 'Burntsushi/ripgrep' },
  keys = {
    { "<leader>dv", mode = "n", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>dc", mode = "n", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
}
