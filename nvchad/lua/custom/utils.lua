local utils = {}
utils.telescope = {
  oldfiles_cwd = function ()
    require("telescope.builtin").oldfiles({ cwd = vim.loop.cwd() })
  end,
  buffers = function ()
    require("telescope.builtin").buffers({
        path_display = { "smart" },
        -- layout_strategy = "bottom_pane",
        -- layout_config = { height = 0.5 },
        sorting_strategy = "ascending",
        sort_mru = true,
        ignore_current_buffer = true,
    })
  end
}

return utils
