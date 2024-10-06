return { 
  "catppuccin/nvim", 
  lazy = false,
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
  			},
      },
      integrations = {
      treesitter = true
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
