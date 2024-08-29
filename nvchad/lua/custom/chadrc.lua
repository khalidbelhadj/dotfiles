---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  tabufline = {
    enabled = false
  },

  theme = "fleet",
  theme_toggle = { "fleet", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true,

  cmp = {
    style = "atom",
  },

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files (cwd)", "Spc f r", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  telescope = {
    -- style = "bordered"
  },

  statusline = {
    theme = "default"
    --   overriden_modules = function(modules)
    --     table.insert(
    --       modules,
    --       5,
    --       (function()
    --         local word_count = vim.fn.wordcount()
    --         if (word_count.visual_words ~= nil) then
    --           return tostring(word_count.visual_words) .. ' words selected'
    --         end
    --         return tostring(word_count.words) .. ' words'
    --       end
    --       )()
    --     )
    --   end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
