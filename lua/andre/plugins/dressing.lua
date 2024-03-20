return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    prefer_width = 60,
    input = {
      get_config = function()
        if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
          return { enabled = false }
        end
      end,
    },
  },
}
