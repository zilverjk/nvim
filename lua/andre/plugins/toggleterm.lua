local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

local keymap = vim.keymap

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	keymap.set("t", "<ESC>", [[<C-\><C-n>]], opts)
	keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

toggleterm.setup({
	direction = "horizontal",
	size = 20,
	open_mapping = [[<C-t>]],
	close_on_exist = false,
})
