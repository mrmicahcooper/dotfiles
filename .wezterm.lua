local wezterm = require 'wezterm'
return {
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },

  -- color_scheme = "Catppuccin Latte", -- Mocha, Macchiato, Frappe, Latte
  -- color_scheme = "Catppuccin Mocha", -- Mocha, Macchiato, Frappe, Latte
  -- color_scheme = "Catppuccin Frappe", -- Mocha, Macchiato, Frappe, Latte
  color_scheme = "Catppuccin Macchiato", -- Mocha, Macchiato, Frappe, Latte
  --
  font = wezterm.font 'Maple Mono NF',
  -- font = wezterm.font '0xProto Nerd Font',
  -- font = wezterm.font 'IntelOneMono Nerd Font',
  -- font = wezterm.font 'FantasqueSansMono Nerd Font Mono',
  -- font = wezterm.font 'JuliaMono',
  -- font = wezterm.font 'VictorMono Nerd Font',
  font_size = 20,
  line_height = 1.1,
  -- freetype_load_target = 'Light'
  -- freetype_load_target = 'HorizontalLcd',
  dpi = 96.0
}
