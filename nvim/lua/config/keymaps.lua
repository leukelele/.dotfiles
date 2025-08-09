local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- goto
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

-- lsp behaviors
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("i", "<A-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- note creation
map("n", "<leader>nn", function()
  local filename = os.date("%y%m%d%H%S") .. ".md"
  local filepath = vim.fn.getcwd() .. "/" .. filename
  vim.cmd("edit " .. filepath)
end, { desc = "new note in cwd" })

-- pane and window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

-- telescope
map("n", "<leader>jf", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })

map("n", "<leader>jd", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live Grep" })

-- tree
map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Toggle Tree" })

-- vim navigation
map("i", "kj", "<Esc>")
map("i", "KJ", "<Esc>")

-- window management
map("n", "<leader>sv", ":vsplit<CR>")
map("n", "<leader>sh", ":split<CR>")
