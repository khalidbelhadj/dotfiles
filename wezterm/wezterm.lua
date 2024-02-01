-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 0,
}

-- config.front_end = "WebGpu"

-- config.color_scheme = 'fleet'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.colors = {
  cursor_bg = "#ffffff",
  background = "#151515",
}

-- and finally, return the configuration to wezterm
return config
