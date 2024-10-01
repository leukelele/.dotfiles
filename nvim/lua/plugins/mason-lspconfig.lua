local opts = {
  ensure_installed = {
    "clangd",
    "lua_ls",
  },
  automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    event = "BufReadPre",
    opts = opts,
}
