local status, nvim_ufo = pcall(require, "ufo")
if not status then
	return
end

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local keymap = vim.keymap
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
keymap.set("n", "zR", nvim_ufo.openAllFolds)
keymap.set("n", "zM", nvim_ufo.closeAllFolds)

nvim_ufo.setup({
	provider_selector = function()
		return { "treesitter", "indent" }
	end,
})
