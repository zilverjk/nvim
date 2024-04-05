return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
      },
    },
  },
  config = function()
    local utils = require("dap-vscode-js.utils")

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
      debugger_path = utils.join_paths(utils.get_runtime_dir(), "lazy/vscode-js-debug"),
    })

    local node = { "typescript", "javascript" }
    local react = { "typescriptreact", "javascriptreact" }

    -- NOTE: Para que esto funcione, siempre hay que poner el flag --inspect al lanzar la app en la terminal
    -- Config para debuggear Node
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

    -- Config para debuggear React
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

    local key = vim.keymap
    key.set("n", "<F5>", nvim_dap.continue)
    key.set("n", "<F10>", nvim_dap.step_over)
    key.set("n", "<F11>", nvim_dap.step_into)
    key.set("n", "<F12>", nvim_dap.step_out)
    key.set("n", "<leader>tb", nvim_dap.toggle_breakpoint)
    key.set("n", "<leader>tB", function()
      nvim_dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end)
    key.set("n", "<F3>", nvim_dap.repl.toggle)
    key.set("n", "<F4>", nvim_dap.terminate)
  end,
}
