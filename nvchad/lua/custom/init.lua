vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

vim.opt.pumheight = 15
vim.opt.autochdir = false
vim.opt.scrolloff = 8
vim.opt.listchars:append({ space = "·" })

-- Hightlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 0 }
  end,
})

vim.api.nvim_create_user_command('Hex', '%!xxd', {})
vim.api.nvim_create_user_command('UnHex', '%!xxd -r', {})
vim.api.nvim_create_user_command('UnHex', '%!xxd -r', {})


vim.cmd("autocmd BufNewFile,BufRead *.frag setfiletype glsl")
vim.cmd("autocmd BufNewFile,BufRead *.vert setfiletype glsl")

vim.cmd("autocmd BufNewFile,BufRead *.zsh setfiletype sh")

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
