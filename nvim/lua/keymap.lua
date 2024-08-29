local map = vim.keymap.set

map("v", "<", "<gv", {})
map("v", ">", ">gv", {})
map("n", "<ESC>", function() vim.cmd('noh') end, {})
