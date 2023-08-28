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

local plugins = {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	-- Colorschemes
	"bluz71/vim-nightfly-guicolors",
	"folke/tokyonight.nvim",
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window
	-- commenting with gc
	"numToStr/Comment.nvim",
	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	-- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" }, -- autoclose tags
	-- git integration
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	-- multiple text selection
	{ "mg979/vim-visual-multi", branch = "master" },

	-- buffer
	{ "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"LukasPietzschmann/telescope-tabs",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{ "schickling/vim-bufonly" },

	-- Comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Rainbow brackets
	"mrjones2014/nvim-ts-rainbow",

	-- Smooth scroll
	"karb94/neoscroll.nvim",

	-- Folding code
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

	-- Toggle Terminal
	{ "akinsho/toggleterm.nvim", version = "*" },
	-- Template String Toggle
	"axelvc/template-string.nvim",
	-- Indent lines
	"lukas-reineke/indent-blankline.nvim",

	-- Neode,
	"folke/neodev.nvim",

	-- Debugging Nodejs
	{
		"microsoft/vscode-js-debug",
		-- version = "v1.74.1",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	"mfussenegger/nvim-dap",
	"mxsdev/nvim-dap-vscode-js",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"theHamsta/nvim-dap-virtual-text",

	-- Debugging Rust
	"simrat39/rust-tools.nvim",

	-- Database
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
			"tpope/vim-dotenv",
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
