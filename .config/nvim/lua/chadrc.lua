-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

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

M.base46 = {
  theme = "everforest",
}

return M
