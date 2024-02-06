-- this line for types, by hovering and autoclds, and what highlightings the color used for
---@type Base46Table
local M = {}

-- UI
M.base_30 = {
  white = "#e5e5e5",
  black = "#151515", -- usually your theme bg
  darker_black = "#111111", -- 6% darker than black
  black2 = "#222222", -- 6% lighter than black
  one_bg = "#2b2b2b", -- 10% lighter than black
  one_bg2 = "#303030", -- 6% lighter than one_bg2
  one_bg3 = "#3b3b3b", -- 6% lighter than one_bg3
  grey = "#707070", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#808080", -- 10% lighter than grey
  grey_fg2 = "#555464",
  light_grey = "#858585",
  red = "#ec5f6a",
  baby_pink = "#ffa5c3",
  pink = "#d999d8",
  line = "#252525", -- 15% lighter than black
  green = "#afca95",
  vibrant_green = "#b6f4be",
  nord_blue = "#8fc9ff",
  blue = "#8fc9ff",
  yellow = "#e5c895", -- 8% lighter than yellow
  sun = "#e5c895",
  purple = "#9c8ce6",
  dark_purple = "#8672eb",
  teal = "#B5E8E0",
  orange = "#F8BD96",

  cyan = "#78d0bd",

  statusline_bg = "#1d1d1d",
  lightbg = "#3a3a3a",
  pmenu_bg = "#8fc9ff",
  folder_bg = "#6692c9"
}

M.base_16 = {
  base00 = "#151515",
  base01 = "#1d1d1d",
  base02 = "#3a3a3a",
  base03 = "#808080",
  base04 = "#d9d9c4",
  base05 = "#efefef",
  base06 = "#ccd3e1",
  base07 = "#D9E0EE",
  base08 = "#a292f0",
  base09 = "#f18f97",
  base0A = "#e5e5e5",
  base0B = "#d999d8",
  base0C = "#e5c895",
  base0D = "#8fc9ff",
  base0E = "#8fc9ff",
  base0F = "#d0d0d0"
}

M.polish_hl = {
  ["@function"] = { fg="yellow",  italic = true, bold = true },
  ["@function.call"] = { fg="yellow",  italic = true, bold = true },
  ["@method.call"] = { fg="yellow",  italic = true, bold = true },
  ["@type.builtin"] = { fg="blue",  italic = true, bold = false },
  ["@variable"] = { fg="white",  italic = true, bold = false },
  ["@character"] = { fg="pink",  italic = true },
  -- IndentBlanklineContextStart = { bg = "lighter_black" },
  NvimTreeGitDirty = { fg = "yellow"},
  NvimTreeGitNew = { fg = "green"},
  NvimTreeGitIgnored = { fg = "gray"},
  NvimTreeGitDeleted = { fg = "red"},
  Tag = { fg = "cyan"},
  Type = { fg = "blue", italic=true},
  Macro = {fg = "green"},
  Repeat = {fg = "blue"},
  DevIconpy = {fg = "yellow"},
}

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "fleet")

return M
