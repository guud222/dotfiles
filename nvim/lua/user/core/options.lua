local opt = vim.opt

-- line number
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitbelow = true
opt.splitright = true

-- keywords
opt.iskeyword:append("-")

-- show mode
opt.showmode = false

-- completion menu
opt.completeopt = "menu,menuone,noselect"

-- swap file
opt.swapfile = false
