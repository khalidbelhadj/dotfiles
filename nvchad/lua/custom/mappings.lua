---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Closing and saving nvim
    ["<leader>q"] = { "<cmd> q <CR>", "Quit nvim" },
    ["<leader>Q"] = { "<cmd> qa <CR>", "Quit nvim without saving" },
    ["<leader>s"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>S"] = { "<cmd> wa <CR>", "Save all open buffers" },

    ["<leader>v"] = { "<cmd> vsp <CR>", "Vertical split" },
    -- ["<leader>h"] = { "<cmd> sp <CR>", "Horizontal split" },
    ["<leader>d"] = { "<cmd> close <CR>", "Close split" },

    ["<leader>o"] = { "o<ESC>" },
    ["<leader>O"] = { "O<ESC>" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

  },
}

M.harpoon = {
  n = {
    ["<leader>hq"] = {
      function ()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Harpoon toggle quick menu"
    },
    ["<leader>ha"] = {
      function ()
        require("harpoon.mark").add_file()
      end,
      "Harpoon toggle quick menu"
    },
    ["<leader>h1"] = {
      function ()
        require("harpoon.ui").nav_file(1)
      end,
      "Harpoon toggle quick menu"
    },
    ["<leader>h2"] = {
      function ()
        require("harpoon.ui").nav_file(2)
      end,
      "Harpoon toggle quick menu"
    },
    ["<leader>h3"] = {
      function ()
        require("harpoon.ui").nav_file(3)
      end,
      "Harpoon toggle quick menu"
    },
    ["<leader>h4"] = {
      function ()
        require("harpoon.ui").nav_file(4)
      end,
      "Harpoon toggle quick menu"
    }
  }
}

M.lspconfig = {
  n = {
    ["gh"] = { "<cmd> lua vim.diagnostic.open_float() <CR>", "Floating diagnostic" },
    -- ["gh"] = { "<cmd> lua vim.diagnostic.open_float { border = 'rounded' } <CR>", "Floating diagnostic" },
    ["<C-w>d"] = { "<cmd> vert winc ] <CR>", "Go to definition vsplit" },
  },
}

M.telescope = {
  n = {
    ["<leader>fr"] = { "<cmd> lua require('custom.utils').telescope.oldfiles_cwd() <CR>", "Find recent (cwd)" },
    ["<leader>fR"] = { "<cmd> Telescope oldfiles <CR>", "Find recent" },
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find project" },
    ["<leader>fb"] = { "<cmd> lua require('custom.utils').telescope.buffers() <CR>", "Find buffers" },
    ["<leader>fd"] = { "<cmd> Telescope file_browser <CR>", "File browser" },

  },

  v = {
    [">"] = { ">gv" },
    ["<"] = { "<gv" },
  },
}

M.disabled = {
  n = {
    ["<leader>fo"] = "",
    ["<leader>f"] = "",
    ["<leader>h"] = "",
    ["<C-n>"] = "",
  },
}

-- more keybinds!

return M
