return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    exclude_filetypes = {
      "gitcommit",
      "toggleterm",
      "neo-tree",
    },
    create_autocmd = false,
  },
}
