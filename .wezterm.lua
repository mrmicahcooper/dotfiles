local wezterm = require 'wezterm'
return {
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },

  color_scheme = "Catppuccin Latte",
  -- color_scheme = "Catppuccin Mocha",
  -- color_scheme = "Catppuccin Frappe",
  -- color_scheme = "Catppuccin Macchiato",

  font = wezterm.font 'Maple Mono NF',
  -- font = wezterm.font '0xProto Nerd Font',
  -- font = wezterm.font 'IntelOneMono Nerd Font',
  -- font = wezterm.font 'FantasqueSansMono Nerd Font Mono',
  -- font = wezterm.font 'JuliaMono',
  -- font = wezterm.font 'VictorMono Nerd Font',
  font_size = 22,
  line_height = 1,
  -- freetype_load_target = 'Light'
  -- freetype_load_target = 'HorizontalLcd',
  dpi = 96.0
}
