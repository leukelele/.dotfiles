local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "goto definition" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("i", "<A-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Note creation in current working directory
map("n", "<leader>nn", function()
    local filename = os.date("%y%m%d") .. ".md"
    local filepath = vim.fn.getcwd() .. "/" .. filename
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
end, { desc = "new note in CWD" })

-- Insert mode escape
map("i", "kj", "<Esc>", opts)
map("i", "KJ", "<Esc>", opts)

-- Window management
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "split horizontal" })
