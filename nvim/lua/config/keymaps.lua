local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- directory navigation
map("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- goto footnote
map("n", "gD", function()
	local word = vim.fn.expand("<cword>") -- gets ^1 when cursor is on [^1]
	vim.cmd("/\\[\\^" .. word:gsub("%^", "") .. "\\]:")
end, { desc = "Jump to footnote definition" })

-- pane and window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

-- vim navigation
map("i", "kj", "<Esc>")
map("i", "KJ", "<Esc>")

-- window management
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>sh", ":split<CR>", opts)
