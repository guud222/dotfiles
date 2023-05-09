vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "x", '"_x')

keymap.set("n", "L", "$")
keymap.set("n", "H", "^")
keymap.set("v", "L", "$")
keymap.set("n", "H", "^")
keymap.set("o", "L", "$")
keymap.set("o", "H", "^")

keymap.set("n", "<leader>sv", ":vsplit<CR>")
keymap.set("n", "<leader>sh", ":split<CR>")

keymap.set("n", "<leader>wh", "<C-w>h")
keymap.set("n", "<leader>wj", "<C-w>j")
keymap.set("n", "<leader>wk", "<C-w>k")
keymap.set("n", "<leader>wl", "<C-w>l")

keymap.set("n", "<leader>tc", ":tabnew<CR>")
keymap.set("n", "<leader>tn", ":tabnext<CR>")
keymap.set("n", "<leader>tp", ":tabprevious<CR>")

-- plugins keymap

-- nvim-tree
keymap.set("n", "<leader>es", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>sf", ":Telescope find_files<CR>", { desc = "[S]earch [F]iles", silent = true })
keymap.set("n", "<leader>ss", ":Telescope live_grep<CR>", { desc = "[S]earch [S]trings", silent = true })
keymap.set("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "[S]earch [H]elp", silent = true })
keymap.set(
	"n",
	"<leader>ec",
	":Telescope find_files cwd=~/.config/nvim<CR>",
	{ desc = "[E]dit [C]onfig", silent = true }
)
