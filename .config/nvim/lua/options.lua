require "nvchad.options"

local o = vim.opt

o.cursorlineopt = "both"
o.number = true
o.relativenumber = true

-- Whitespace rendering
o.listchars = {
  space = "·",
  trail = "·",
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
