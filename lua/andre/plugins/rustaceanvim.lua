return {
  "mrcjkb/rustaceanvim",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  version = "^4",
  lazy = false,
  config = function()
    local key = vim.keymap
    local bufnr = vim.api.nvim_get_current_buf()

    local nvim_dap_status, nvim_dap = pcall(require, "dap")
    if not nvim_dap_status then
      return
    end

    key.set("n", "<leader>ca", function()
      vim.cmd.RustLsp("codeAction")
    end, { silent = true, buffer = bufnr })

    nvim_dap.adapters.lldb = {
      type = "executable",
      command = "lldb-vscode",
      name = "lldb",
    }

    nvim_dap.configurations.rust = {
      {
        type = "lldb",
        name = "Debug",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
    }

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
