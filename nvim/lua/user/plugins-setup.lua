local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

lazy_status, lazy = pcall(require, "lazy")
if not lazy_status then
	return
end

lazy.setup({
	-- lua functions that many plugins use
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- colorscheme
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },

	-- comment
	{ "numToStr/Comment.nvim", lazy = true },

	-- file explorer
	{ "nvim-tree/nvim-tree.lua" },

	-- icons
	{ "nvim-tree/nvim-web-devicons" },

	-- statusline
	{ "nvim-lualine/lualine.nvim" },

	-- fuzzy finding
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },

	-- autocompletion
	{ "hrsh7th/nvim-cmp" }, -- completion plugin
	{ "hrsh7th/cmp-buffer" }, -- source for text in buffer
	{ "hrsh7th/cmp-path" }, -- source for file system paths

	-- snippets
	{ "L3MON4D3/LuaSnip" }, -- snippet engine
	{ "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
	{ "rafamadriz/friendly-snippets" }, -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	{ "williamboman/mason.nvim" }, -- in charge of managing lsp servers, linters & formatters
	{ "williamboman/mason-lspconfig.nvim" }, -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	{ "neovim/nvim-lspconfig" }, -- easily configure language servers
	{ "hrsh7th/cmp-nvim-lsp" }, -- for autocompletion
	{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion
	-- formatting & lintings
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },
	-- git integration
	{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
})
