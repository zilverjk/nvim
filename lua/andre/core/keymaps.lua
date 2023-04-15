-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>")

-- remap redo
-- keymap.set("n", "<C-y>", ":redo<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

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
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>g", ":Gedit<cr>") -- Show :Git panel
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- gitsigns
keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame") -- Toggle git blame in the current line

-- bufferline
keymap.set("n", "<leader>bb", ":bprevious<CR>")
keymap.set("n", "<leader>bn", ":bnext<CR>")
keymap.set("n", "<leader>bc", ":bd<CR>")
keymap.set("n", "<leader>bo", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>bce", ":BufOnly<CR>") -- open new tab

-- Telescope-tabs
keymap.set("n", "<leader>bf", ":Telescope telescope-tabs list_tabs<CR>")

-- Debugger
-- keymap.set("n", "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<CR>") -- Run to Cursor
-- keymap.set("n", "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>") -- Evaluate Input
-- keymap.set("n", "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>") -- Conditional Breakpoint
-- keymap.set("n", "<leader>dU", "<cmd>lua require'dapui'.toggle()<CR>") -- Toggle UI
-- keymap.set("n", "<leader>db", "<cmd>lua require'dap'.step_back()<CR>") -- Step Back
-- keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>") -- Continue
-- keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<CR>") -- Disconnect
-- keymap.set("n", "<leader>de", "<cmd>lua require'dapui'.eval()<CR>") -- Evaluate
-- keymap.set("n", "<leader>dg", "<cmd>lua require'dap'.session()<CR>") -- Get Session
-- keymap.set("n", "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>") -- Hover Variables
-- keymap.set("n", "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<CR>") -- Scopes
-- keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>") -- Step Into
-- keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>") -- Step Over
-- keymap.set("n", "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<CR>") -- Pause
-- keymap.set("n", "<leader>dq", "<cmd>lua require'dap'.close()<CR>") -- Quit
-- keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>") -- Toggle Repl
-- keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.continue()<CR>") -- Start
-- keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<CR>") -- Toggle Breakpoint
-- keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<CR>") -- Terminate
-- keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<CR>") -- Step Out
