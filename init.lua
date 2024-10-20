vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("andre.core")
require("andre.lazy")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
