-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}


---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  -- Only apply to the fleet theme
  ["@function"] = { fg="yellow",  italic = true, bold = true },
  ["@function.call"] = { fg="yellow",  italic = true, bold = true },
  ["@method.call"] = { fg="yellow",  italic = true, bold = true },
  ["@type.builtin"] = { fg="blue",  italic = true, bold = false },
  ["@variable"] = { fg="white",  italic = true, bold = false },
  ["@character"] = { fg="pink",  italic = true },
  NormalFloat = { bg = "darker_black" },
  IndentBlanklineContextStart = { bg = "lighter_black" },
  NvimTreeGitDirty = { fg = "yellow"},
  NvimTreeGitNew = { fg = "green"},
  NvimTreeGitIgnored = { fg = "gray"},
  NvimTreeGitDeleted = { fg = "red"},
  Tag = { fg = "cyan"},
  Type = { fg = "blue", italic=true},
  Macro = { fg = "green" },
  Repeat = {fg = "blue"},
  DevIconpy = {fg = "yellow"},
}

---@type HLTable
M.add = {
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
