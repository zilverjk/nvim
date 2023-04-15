local nvim_dap_status, nvim_dap = pcall(require, "dap")
if not nvim_dap_status then
	return
end

local nvim_dap_vscode_js_status, nvim_dap_vscode_js = pcall(require, "dap-vscode-js")
if not nvim_dap_vscode_js_status then
	return
end

nvim_dap_vscode_js.setup({
	node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_path = debugger_path,
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = {
		"pwa-node",
		"pwa-chrome",
		"node-terminal",
	}, -- which adapters to register in nvim-dap
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

local node = { "typescript", "javascript" }
local react = { "typescriptreact", "javascriptreact" }

for _, language in ipairs(node) do
	nvim_dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		-- {
		-- 	type = "pwa-node",
		-- 	request = "attach",
		-- 	name = "Attach",
		-- 	processId = require("dap.utils").pick_process,
		-- 	cwd = "${workspaceFolder}",
		--     -- port = 9229,
		-- 	-- websocketAddress = "ws://127.0.0.1:9229",
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "NestJS: Launch",
		-- 	-- runtimeExecutable = "nest",
		-- 	program = "${workspaceFolder}/src/main.ts",
		-- 	cwd = "${workspaceFolder}",
		-- 	skipFiles = {
		-- 		"<node_internals>/**",
		-- 	},
		-- 	sourceMaps = true,
		-- 	resolveSourceMapLocations = {
		-- 		"${workspaceFolder}/**",
		-- 		"!**/node_modules/**",
		-- 	},
		-- 	protocol = "inspector",
		-- 	console = "integratedTerminal",
		-- 	port = 3000,
		-- 	-- args = { "start", "--watch", "--debug" },
		-- 	env = {
		-- 		NODE_ENV = "dev",
		-- 	},
		-- 	outFiles = {
		-- 		"${workspaceFolder}/dist/main.js",
		-- 	},
		-- 	sourceMapPathOverrides = {
		-- 		["webpack:///./src/*"] = "${workspaceFolder}/src/*",
		-- 		["webpack:///src/*"] = "${workspaceFolder}/src/*",
		-- 		["webpack:///*"] = "*",
		-- 	},
		-- },
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			-- cwd = vim.fn.getcwd(),
			address = "127.0.0.1",
			-- port = 9229,
			-- sourceMaps = true,
			skipFiles = {
				"<node_internals>/**/*.js",
			},
			websocketAddress = "ws://127.0.0.1:9229",
			-- port = "${PORT}",
		},
		-- -- {
		-- -- 	type = "pwa-chrome",
		-- -- 	request = "launch",
		-- -- 	name = 'Start Chrome with "localhost"',
		-- -- 	url = "http://localhost:3000",
		-- -- 	webRoot = "${workspaceFolder}",
		-- -- 	userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
		-- -- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Debug Jest Tests",
		-- 	-- trace = true, -- include debugger info
		-- 	runtimeExecutable = "node",
		-- 	runtimeArgs = {
		-- 		"./node_modules/jest/bin/jest.js",
		-- 		"--runInBand",
		-- 	},
		-- 	rootPath = "${workspaceFolder}",
		-- 	cwd = "${workspaceFolder}",
		-- 	console = "integratedTerminal",
		-- 	internalConsoleOptions = "neverOpen",
		-- },
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
