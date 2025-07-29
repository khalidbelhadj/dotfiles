local map = vim.keymap.set

map("v", "<", "<gv", {})
map("v", ">", ">gv", {})
map("n", "<ESC>", function() vim.cmd('noh') end, {})
map("n", "[b", "<CMD> :bprev <CR>", {})
map("n", "]b", "<CMD> :bnext <CR>", {})
map("n", "<leader>v", "<CMD> :vsplit <CR>", {})
map("n", "<leader>c", "<CMD> :close <CR>", {})
map("n", "<leader>s", "<CMD> :split <CR>", {})
