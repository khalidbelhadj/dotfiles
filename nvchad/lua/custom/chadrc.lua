---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "jellybeans",
  theme_toggle = { "jellybeans", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true,

  cmp = {
    style = "atom",
  },

}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M