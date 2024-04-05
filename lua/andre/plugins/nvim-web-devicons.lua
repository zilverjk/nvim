return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").set_icon({
      ts = {
        icon = "",
        color = "#0288D1",
        cterm_color = "67",
        name = "TypeScript",
      },
      js = {
        icon = "",
        color = "#FFCA28",
        cterm_color = "67",
        name = "JavaScript",
      },
      cjs = {
        icon = "",
        color = "#FFCA28",
        cterm_color = "67",
        name = "JavaScript",
      },
      gql = {
        icon = "󰡷",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
      [".gitignore"] = {
        icon = "",
        color = "#E64A19",
        cterm_color = "166",
        name = "Git",
      },
    })
  end,
}
