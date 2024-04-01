local overrides = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent           = {
        enable = true,
      },
      playground       = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      textobjects      = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },

      renderer = {
        highlight_git = true,
        icons = {
          webdev_colors = true,
          git_placement = "after",
          show = {
            folder_arrow = false,
          },
        },
      },

      update_focused_file = {
        enable = true,
      },

      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    opts = {
      user_default_options = {
        tailwind = "both",
        css = true,
        always_update = true,
      },
    }
    ,
  },

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = {
  --     defaults = {
  --       path_display = {
  --         "smart",
  --       },
  --     },
  --   }
  --
  -- },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = false,
      show_current_context_start = false,
    }
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "clangd",
      }
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      hijack_unnamed_buffer_when_opening = true,
    }
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  }
}


return overrides
