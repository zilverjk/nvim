return {
  "mxsdev/nvim-dap-vscode-js",
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
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Launch file",
        --   program = "${file}",
        --   cwd = "${workspaceFolder}",
        -- },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
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

    local keymap = vim.keymap
    keymap.set("n", "<F5>", nvim_dap.continue)
    keymap.set("n", "<F10>", nvim_dap.step_over)
    keymap.set("n", "<F11>", nvim_dap.step_into)
    keymap.set("n", "<F12>", nvim_dap.step_out)
    keymap.set("n", "<leader>tb", nvim_dap.toggle_breakpoint)
    keymap.set("n", "<leader>tB", function()
      nvim_dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end)
  end,
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      config = {
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
      },
    },
  },
}
