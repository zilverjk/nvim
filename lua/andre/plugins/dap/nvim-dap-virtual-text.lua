local status, virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status then
	return
end

virtual_text.setup()
