local status, nvim_dap = pcall(require, "dap")
if not status then
	return
end

local keymap = vim.keymap
keymap.set("n", "<F5>", nvim_dap.continue)
keymap.set("n", "<F10>", nvim_dap.step_over)
keymap.set("n", "<F11>", nvim_dap.step_into)
keymap.set("n", "<F12>", nvim_dap.step_out)
keymap.set("n", "<leader>tb", nvim_dap.toggle_breakpoint)
keymap.set("n", "<leader>tB", function()
	nvim_dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
