return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
  end,
  opts = {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  },
}
