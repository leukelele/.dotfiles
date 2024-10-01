local config = function() 
  require'nvim-treesitter.configs'.setup({
    auto_install = true,
    ensure_installed = {
      "c",
      "lua",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
    },
    highlight = {
      enable = true,
    },
  })
end

  return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
  }
