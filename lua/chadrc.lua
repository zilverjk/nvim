local M = {}

M.base46 = {
  theme = "tokyonight",
  hl_override = {
    Include = { italic = true },
    ["@keyword"] = { italic = true },
    ["@keyword.function"] = { italic = true },
    ["@keyword.return"] = { italic = true },
    ["@keyword.operator"] = { italic = true },
    ["@keyword.import"] = { italic = true },
    ["@keyword.exception"] = { italic = true },
    ["@keyword.conditional"] = { italic = true },
    ["@function"] = { italic = true },
    ["@reference"] = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  cmp = {
    icons_left = true,
  },
}

return M
