return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = true,
    cmd = { "Telescope" },
    dependencies = { 'nvim-lua/plenary.nvim', 'burntsushi/ripgrep' },
    opts = {
        defaults = {
            mappings = {
                i = { ["<esc>"] = require("telescope.actions").close },
            },
        },
    },
}
