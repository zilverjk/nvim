return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      buffer_close_icon = "",
      close_icon = "",
      show_close_icon = false,
      show_buffer_close_icon = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, _, context)
        if context.buffer:current() then
          return ""
        end

        return ""
      end,
    },
  },
}
