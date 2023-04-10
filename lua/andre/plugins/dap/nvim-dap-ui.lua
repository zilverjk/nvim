local dap_ui_status, dap_ui = pcall(require, "dapui")
if not dap_ui_status then
	return
end

local nvim_dap_status, nvim_dap = pcall(require, "dap")
if not nvim_dap_status then
	return
end

local keymap = vim.keymap
keymap.set("n", "<leader>du", dap_ui.toggle)

nvim_dap.listeners.after.event_initialized["dapui_config"] = function()
	dap_ui.open({})
end

nvim_dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.close({})
end

nvim_dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.close({})
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })

dap_ui.setup()
