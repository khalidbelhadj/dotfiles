local new = {
  {
    "williamboman/mason-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim"
    },
    config = function()
      local utils = require "core.utils"

      local on_attach = function(client, bufnr)
        utils.load_mappings("lspconfig", { buffer = bufnr })

        if client.server_capabilities.signatureHelpProvider then
          require("nvchad.signature").setup(client)
        end

        if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      require("mason-lspconfig").setup {}
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,

        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        -- ["rust_analyzer"] = function ()
        --     require("rust-tools").setup {}

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,

            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                },
              },
            },
          }
        end
      }

      vim.diagnostic.config({
        virtual_text = false
      })
    end,
  },

  -- {
  --   "f-person/git-blame.nvim",
  --   event = { "BufEnter" },
  --   config = function()
  --     vim.g.gitblame_enabled = 0
  --     vim.g.gitblame_delay = 1000
  --   end,
  -- },

  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      -- Remove line numbers in fugitive
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('fugitive_no_line_num', {}),
        desc = 'Disable line numbers for fugitive',
        pattern = '*',
        callback = function()
          if string.find(vim.api.nvim_buf_get_name(0), "fugitive://") then
            vim.opt.number = false
          end
        end,
      })
    end
  },

  {
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }

      wilder.set_option("pipeline", {
        wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
      })

      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer {
          highlighter = wilder.basic_highlighter(),
          pumblend = 20,
          left = { " ", wilder.popupmenu_devicons() },
          max_height = 15,
        }
      )
      -- wilder.set_option("renderer",
      --     -- TODO: Get rounded borders to work
      --     wilder.popupmenu_border_theme {
      --       highlights = {
      --         border = "Normal", -- highlight to use for the border
      --       },
      --       border = "rounded",
      --     }
      -- )
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    lazy = false,
  },

  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre " .. vim.fn.expand "~" .. "/Notes/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/Notes/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Notes/",
        },
      },
      -- see below for full list of options 👇
    },
  },

  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio"
    },
    lazy = false,
    config = function()
      local dap = require('dap')
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return 'python3'
          end,
        },
      }

      dap.adapters.python = function(cb, _)
        cb({
          type = 'executable',
          command = 'python3',
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        })
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    lazy = false,
    config = function()
      require("dapui").setup()
    end
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = false,
    config = function()
      require('ts_context_commentstring').setup()
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup()
    end
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && pnpm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}

return new
