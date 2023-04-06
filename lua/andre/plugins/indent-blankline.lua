local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	return
end

local opt = vim.opt
opt.list = true
opt.listchars:append("space:⋅")

indent_blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
