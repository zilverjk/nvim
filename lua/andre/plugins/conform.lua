return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre" },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer with conform",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      typescript = { { "eslint_d", "prettierd", "prettier" } },
      javascript = { { "eslint_d", "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      sass = { { "prettierd", "prettier" } },
      less = { { "prettierd", "prettier" } },
      graphql = { { "prettierd", "prettier" } },
      svelte = { { "prettierd", "prettier" } },
      vue = { { "prettierd", "prettier" } },
    },
    format_on_save = { timeout_ms = 500, async = false, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
