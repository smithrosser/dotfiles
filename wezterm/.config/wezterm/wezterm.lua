local wezterm = require 'wezterm'
local font_name = 'FiraCode Nerd Font'

return {
  color_scheme = 'Tokyo Night Storm',
  font = wezterm.font {
    family = font_name,
    weight = 500,
  },
  font_rules = {
    -- disable italics
    { intensity = 'Normal', italic = true, font = wezterm.font { family = font_name, italic = false, weight = 500 } },
    { intensity = 'Bold', italic = true, font = wezterm.font { family = font_name, italic = false, weight = 900 } },
  },
  font_size = 16,
  cell_width = 0.9,

  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },

  front_end = 'WebGpu',
  enable_wayland = false,
  enable_tab_bar = false,
  enable_scroll_bar = false,

  default_prog = (wezterm.target_triple == 'x86_64-pc-windows-msvc' and { 'pwsh', '-nologo' }) or nil,
}
