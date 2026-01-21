local wezterm = require 'wezterm'
local font_name = 'FiraCode Nerd Font'

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function get_scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night Moon'
  else
    return 'Tokyo Night Day'
  end
end

return {
  color_scheme = get_scheme_for_appearance(get_appearance()),
  font = wezterm.font {
    family = font_name,
    weight = 450,
    harfbuzz_features = { 'ss15' },
  },
  font_rules = {
    -- Optionally disable italics
    -- {
    --   intensity = 'Normal',
    --   italic = true,
    --   font = wezterm.font { family = font_name, italic = false, weight = 500 },
    -- },
    -- {
    --   intensity = 'Bold',
    --   italic = true,
    --   font = wezterm.font { family = font_name, italic = false, weight = 900 },
    -- },
  },
  font_size = 14,
  -- cell_width = 0.9,

  front_end = 'WebGpu',
  window_decorations = 'TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR',
  window_padding = { left = 20, right = 20, top = 20, bottom = 20 },

  enable_wayland = false,
  enable_tab_bar = false,
  enable_scroll_bar = false,

  default_prog = (wezterm.target_triple == 'x86_64-pc-windows-msvc' and { 'pwsh', '-nologo' }) or nil,
}
