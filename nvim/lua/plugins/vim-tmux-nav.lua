-- allows for nav through tmux and nvim in conjunction
return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        -- Ensure the plugin is loaded and configured correctly
        vim.g.tmux_navigator_no_mappings = 1
    end,
}
