return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  opts = function()
    local M = {
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        svelte = {
          require("formatter.filetypes.svelte").prettier,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      command = "FormatWriteLock",
    })

    return M
  end,
}
-- return {
--   "stevearc/conform.nvim",
--   event = "VeryLazy",
--   opts = {
--     formatters_by_ft = {
--       lua = { "stylua" },
--       python = { "black" },
--       javascript = { "prettier" },
--       typescript = { "prettier" },
--       javascriptreact = { "prettier" },
--       typescriptreact = { "prettier" },
--       svelte = { "prettier" },
--       html = { "prettier" },
--       css = { "prettier" },
--       json = { "prettier" },
--       yaml = { "prettier" },
--       markdown = { "prettier" },
--       graphql = { "prettier" },
--       go = { "gofmt" },
--     },
--     format_on_save = {
--       timeout_ms = 500,
--       lsp_fallback = true,
--     },
--   },
-- }
