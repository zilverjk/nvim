-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
--  Copy all text in the buffer
keymap.set("n", "<C-c>", ":%y+<CR>")
-- avoid to copy when delete something
keymap.set("n", "d", '"_d')

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<Esc>", ":noh<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- move lines or blocks
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- preserve clipboard copy while highlighting another word
keymap.set("x", "<leader>p", '"_dP')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")  -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")   -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")     -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")   -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>g", ":Gedit<cr>")                        -- Show :Git panel
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")   -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")  -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")    -- list current changes per file with diff preview ["gs" for git status]

keymap.set("n", "<S-Tab>", ":bprevious<CR>")
keymap.set("n", "<Tab>", ":bnext<CR>")
keymap.set("n", "<leader>x", ":bd<CR>")
keymap.set("n", "<leader>b", ":tabnew<CR>")                  -- open new tab
keymap.set("n", "<leader>bce", ":BufferLineCloseOthers<CR>") -- close everything except current tab
keymap.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>")   -- close everything to the left of current tab
keymap.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>")  -- close everything to the right of current tab

-- Telescope-tabs
keymap.set("n", "<leader>bf", ":Telescope telescope-tabs list_tabs<CR>")

-- Noice
keymap.set("n", "<leader>nn", ":NoiceDismiss<CR>", { noremap = true })
