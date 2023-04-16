local nvim_dap_status, nvim_dap = pcall(require, "dap")
if not nvim_dap_status then
	return
end

local nvim_dap_vscode_js_status, nvim_dap_vscode_js = pcall(require, "dap-vscode-js")
if not nvim_dap_vscode_js_status then
	return
end

nvim_dap_vscode_js.setup({
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

local node = { "typescript", "javascript" }
local react = { "typescriptreact", "javascriptreact" }

-- NOTE: Para que esto funcione, siempre hay que poner el flag --inspect al lanzar la app en la terminal
for _, language in ipairs(node) do
	nvim_dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

for _, language in ipairs(react) do
	nvim_dap.configurations[language] = {
		{
			type = "pwa-chrome",
			request = "attach",
			name = "Attach - Remote Debugging",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch Chrome",
			url = "http://localhost:3000",
		},
	}
end
