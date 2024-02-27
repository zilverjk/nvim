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
      typescript = { { "eslint_d", "prettierd", "prettier", "prettierrc" } },
      javascript = { { "eslint_d", "prettierd", "prettier", "prettierrc" } },
      yaml = { { "prettierd", "prettier", "prettierrc" } },
      html = { { "prettierd", "prettier", "prettierrc" } },
      json = { { "prettierd", "prettier", "prettierrc" } },
      markdown = { { "prettierd", "prettier", "prettierrc" } },
      css = { { "prettierd", "prettier", "prettierrc" } },
      scss = { { "prettierd", "prettier", "prettierrc" } },
      sass = { { "prettierd", "prettier", "prettierrc" } },
      less = { { "prettierd", "prettier", "prettierrc" } },
      graphql = { { "prettierd", "prettier", "prettierrc" } },
      svelte = { { "prettierd", "prettier", "prettierrc" } },
      vue = { { "prettierd", "prettier", "prettierrc" } },
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
