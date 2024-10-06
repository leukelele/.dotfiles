local keymap = vim.keymap

-- directory navigation
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true})

-- pane and window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

-- window management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
