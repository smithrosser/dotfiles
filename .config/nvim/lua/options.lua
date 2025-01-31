require "nvchad.options"

local o = vim.opt

o.cursorlineopt = "both"
o.number = true
o.relativenumber = true

-- Whitespace rendering
local sp_char = "·"
o.listchars = {
  space = sp_char,
  trail = sp_char,
  tab = "› ",
}
o.list = true

-- General buffer options
o.wrap = false
o.scrolloff = 8

-- Misc behaviour
o.swapfile = false
o.backup = false
o.hlsearch = false
o.incsearch = true
o.updatetime = 50

o.cmdheight = 0
