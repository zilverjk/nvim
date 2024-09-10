return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")

    mason.setup({
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "jsonls",
        "html",
        "cssls",
        "prismals",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "pyright",
        "gopls",
        "rust_analyzer",
      },
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua",   -- lua formatter
        -- "eslint_d", -- ts/js linter
        "eslint",   -- ts/js linter
        "mypy",
        "ruff",
        "pyright",
        "black",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = false,
    })
  end,
}
