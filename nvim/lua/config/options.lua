local opt = vim.opt

-- Tab/Indentation
opt.expandtab = false
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true

-- Appearance
opt.list = true
opt.listchars = "tab:> ,space:·"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.termguicolors = true
opt.completeopt = "menuone,noinsert,noselect"
opt.colorcolumn = "85"

-- Behaviors
opt.backspace="indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.conceallevel = 2
opt.errorbells = false
-- opt.foldcolumn = 1
opt.foldlevelstart = 1
opt.foldmethod = manual
opt.hidden = true
opt.iskeyword:append("-")
opt.modifiable = true
opt.undofile = true
vim.keymap.set("i", "kj", "<Esc>")
