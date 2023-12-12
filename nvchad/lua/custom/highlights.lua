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
  -- Macro = { fg = "green" },
  -- ["@operator"] = { fg = "pink" },
  -- ["@function"] = { fg="yellow",  italic = true, bold = true },
  -- ["@method"] = { fg="yellow",  italic = true, bold = false },
  IndentBlanklineContextStart = { bg = "lighter_black" },
  NvimTreeGitDirty = { fg = "yellow"},
  NvimTreeGitNew = { fg = "green"},
  NvimTreeGitIgnored = { fg = "gray"},
  NvimTreeGitDeleted = { fg = "red"},
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
