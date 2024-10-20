vim.g.mapleader = " "

local key = vim.keymap
---------------------
-- General Keymaps
---------------------
--  Copy all text in the buffer
key.set("n", "<C-c>", ":%y+<CR>")
-- avoid to copy when delete something
key.set("n", "d", '"_d')

-- clear search highlights
key.set("n", "<leader>nh", ":nohl<CR>")
key.set("n", "<Esc>", ":noh<CR>")

-- delete single character without copying into register
key.set("n", "x", '"_x')

-- increment/decrement numbers
key.set("n", "<leader>+", "<C-a>") -- increment
key.set("n", "<leader>-", "<C-x>") -- decrement

-- toggle line numbers
key.set("n", "<leader>ln", ":set rnu!<CR>")

-- move lines or blocks
key.set("v", "J", ":m '>+1<CR>gv=gv")
key.set("v", "K", ":m '<-2<CR>gv=gv")

-- preserve clipboard copy while highlighting another word
key.set("x", "<leader>p", '"_dP')

-- window management
key.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
key.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
key.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
key.set("n", "<leader>sx", ":close<CR>") -- close current split window

----------------------
-- Plugin Keybinds
----------------------
-- vim-maximizer
key.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
key.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
key.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")  -- find files within current working directory, respects .gitignore
key.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")   -- find string in current working directory as you type
key.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
key.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")     -- list open buffers in current neovim instance
key.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")   -- list available help tags

-- telescope git commands (not on youtube nvim video)
key.set("n", "<leader>g", ":Gedit<cr>")                        -- Show :Git panel
key.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")   -- list all git commits (use <cr> to checkout) ["gc" for git commits]
key.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
key.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")  -- list git branches (use <cr> to checkout) ["gb" for git branch]
key.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")    -- list current changes per file with diff preview ["gs" for git status]

key.set("n", "<S-Tab>", ":bprevious<CR>")
key.set("n", "<Tab>", ":bnext<CR>")
key.set("n", "<leader>x", ":bd<CR>")
key.set("n", "<leader>b", ":tabnew<CR>")                  -- open new tab
key.set("n", "<leader>bce", ":BufferLineCloseOthers<CR>") -- close everything except current tab
key.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>")   -- close everything to the left of current tab
key.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>")  -- close everything to the right of current tab

-- Telescope-tabs
key.set("n", "<leader>bf", ":Telescope telescope-tabs list_tabs<CR>")

-- LSP Formatting
key.set("n", "<leader>fm", function()
  vim.lsp.buf.format({ async = true })
end)

-- Neotest
key.set("n", "<leader>tr", ":Neotest run<CR>")
key.set("n", "<leader>ts", ":Neotest stop<CR>")
key.set("n", "<leader>tm", ":Neotest summary<CR>")
key.set("n", "<leader>to", ":Neotest output<CR>")
key.set("n", "<leader>tp", ":Neotest output-panel<CR>")
key.set("n", "<leader>td", function()
  require("neotest").run.run({ strategy = "dap" })
end)

-- DAP UI
key.set("n", "<F2>", ":lua require('dapui').toggle()<CR>")

-- Theme Switcher
key.set("n", "<leader>th", function()
  require("nvchad.themes").open({ style = "flat" })
end, {})
