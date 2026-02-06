local wezterm = require 'wezterm'

--
-- Helper functions for determining dark/light theme
--
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function get_scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night Storm'
  else
    return 'Tokyo Night Day'
  end
end

--
-- Commonly used font presets
--
local fonts = {
  iosevka = {
    name = 'Iosevka Nerd Font', -- font family name
    weight = 500, -- font weight
    italic = true, -- enable italics
    features = { 'ss07' }, -- opentype features (stylistic sets, etc)
    squeeze = false, -- reduced cell width
  },
  fira_code = {
    name = 'FiraCode Nerd Font',
    weight = 450,
    italic = false,
    features = {},
    squeeze = false,
  },
  intel_one_mono = {
    name = 'IntoneMono Nerd Font',
    weight = 500,
    italic = true,
    features = { 'ss01' },
    squeeze = true,
  },
}
local font_name = 'fira_code'

--
-- Generate font rule for disabling italics if requested
--
local function get_italics_rules(enable)
  if enable then
    return {}
  end
  return {
    {
      italic = true,
      font = wezterm.font { family = fonts[font_name].name, italic = false },
    },
  }
end

--
-- Configuration
--
return {
  color_scheme = get_scheme_for_appearance(get_appearance()),
  font_size = 12,
  font = wezterm.font {
    family = fonts[font_name].name,
    weight = fonts[font_name].weight,
    harfbuzz_features = fonts[font_name].features,
  },
  font_rules = get_italics_rules(fonts[font_name].italic),
  cell_width = (fonts[font_name].squeeze and 0.9) or 1,

  front_end = 'WebGpu',
  window_decorations = 'TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR',
  window_padding = { left = 20, right = 20, top = 20, bottom = 20 },

  enable_wayland = false,
  enable_tab_bar = false,
  enable_scroll_bar = false,

  default_prog = (wezterm.target_triple == 'x86_64-pc-windows-msvc' and { 'pwsh', '-nologo' }) or nil,
}
