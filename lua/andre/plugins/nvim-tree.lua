return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    nvimtree.setup({
      view = {
        side = "right",
        width = 60,
        relativenumber = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = false,
            file = true,
            folder = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              empty = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store", "^\\.git$" },
      },
      git = {
        enable = false,
        ignore = true,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      sync_root_with_cwd = true,
    })
  end,
}
