return {
  "nvim-lua/plenary.nvim",            -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator",   -- tmux & split window navigation
  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
  {
    "nvchad/ui",
    config = function()
      require("nvchad")
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  "nvchad/volt", -- optional, needed for theme switcher
  -- or just use Telescope themes
}
