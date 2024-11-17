local map = vim.keymap.set

return {
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    init = function()
      local ask_install = {}
      function _G.ensure_treesitter_language_installed()
        local parsers = require "nvim-treesitter.parsers"
        local lang = parsers.get_buf_lang()
        if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) and ask_install[lang] ~= false then
          vim.schedule_wrap(function()
            vim.ui.select({ "yes", "no" }, { prompt = "Install tree-sitter parsers for " .. lang .. "?" }, function(item)
              if item == "yes" then
                vim.cmd("TSInstall " .. lang)
              elseif item == "no" then
                ask_install[lang] = false
              end
            end)
          end)()
        end
      end

      local autocmd = vim.api.nvim_create_autocmd
      autocmd("BufEnter", {
        pattern = "*",
        callback = ensure_treesitter_language_installed
      })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true
        }
      })
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    init = function(_, _)
      map({ "n", "v" }, "<leader>ff", "<cmd> Telescope find_files <CR>", {})
      map({ "n", "v" }, "<leader>fR", "<cmd> Telescope oldfiles <CR>", {})
      map({ "n", "v" }, "<leader>fb", "<cmd> Telescope buffers <CR>", {})
      map({ "n", "v" }, "<leader>fr", function() require('telescope.builtin').oldfiles({ only_cwd = true }) end, {})
      map({ "n", "v" }, "<leader>fw", "<cmd> Telescope live_grep <CR>", {})
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, _)
      vim.cmd('colorscheme catppuccin-macchiato')
    end
  },

  { "rose-pine/neovim", name = "rose-pine" },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = function()
      require("mason").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local on_attach = function(_, _)
        map("n", "K", function() vim.lsp.buf.hover() end, {})
        map("n", "gh", function() vim.diagnostic.open_float() end, {})
        map("n", "gd", function() vim.lsp.buf.definition() end, {})
        map("n", "gr", function() vim.lsp.buf.references() end, {})
        map("n", "<leader>lr", function() vim.lsp.buf.rename() end, {})
        map("n", "<leader>la", function() vim.lsp.buf.code_action() end, {})
        map("n", "<leader>lf", function() vim.lsp.buf.format() end, {})
        map("n", "<leader>ls",
          function()
            require('telescope.builtin').lsp_document_symbols({
              layout_strategy = "center",
              sorting_strategy =
              "ascending"
            })
          end, {})
        map("n", "<leader>lv",
          function() vim.diagnostic.config({ virtual_text = (not vim.diagnostic.config().virtual_text) }) end, {})
      end

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
        virtual_text = true
      })
    end
  },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   -- follow latest release.
  --   version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --   -- install jsregexp (optional!).
  --   build = "make install_jsregexp"
  -- },

  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' },   -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
        }),
        formatting = {
          format = function(_, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
            return vim_item
          end,
        },
      })
    end
  },

  {
    "felipeagc/fleet-theme-nvim",
    config = function() vim.cmd("colorscheme fleet") end
  },

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  --   config = function()
  --     require("ibl").setup {
  --       indent = { char = "|" },
  --     }
  --   end
  -- }

  {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
      require("fidget").setup()
    end
  }
}
