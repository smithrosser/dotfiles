-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "arrow",
  },
  nvdash = {
    load_on_startup = true,
  },
}

-- Larger floating terminal
M.term = {
  float = {
    relative = "editor",
    row = 0.15,
    col = 0.1,
    width = 0.8,
    height = 0.7,
    border = "single",
  },
}

return M
