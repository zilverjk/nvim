local status, bufferline = pcall(require, "bufferline")

if not status then
	return
end

bufferline.setup({
	options = {
		buffer_close_icon = "",
		close_icon = "",
		show_close_icon = false,
		show_buffer_close_icon = false,
	},
})
