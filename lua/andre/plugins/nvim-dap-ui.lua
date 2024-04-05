return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "󰁕", texthl = "", linehl = "", numhl = "" })

    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup({
      icons = { collapsed = "", current_frame = "", expanded = "" },
      layouts = {
        {
          elements = { "scopes", "watches", "stacks", "breakpoints" },
          size = 80,
          position = "left",
        },
        {
          elements = { "console", "repl" },
          size = 0.25,
          position = "bottom",
        },
      },
      render = { indent = 2 },
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
