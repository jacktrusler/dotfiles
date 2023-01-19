local g = vim.g
local opt = vim.opt

g.netrw_banner = 0
g.mkdp_markdown_css = '/home/jack/.config/nvim/lua/settings/markdownPlugin.css'
-- Colors
opt.termguicolors = true
opt.hlsearch = false
-- Indenting
opt.expandtab = true -- insert mode puts in spaces when tabbing
opt.tabstop = 2 -- number of spaces a tab counts for
opt.softtabstop = 2 -- editing operations (like <BS>) are deleting 2 spaces
opt.shiftwidth = 2
opt.smartindent = true
opt.wrap = false
-- Line Numbers & Side Column
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false -- show line and cursor position, redundant with lualine
opt.scrolloff = 10 -- scroll (x) lines from top and bottom
-- opt.signcolumn = "no" -- don't expand column on errors
-- Searching
opt.ignorecase = true
opt.smartcase = true -- caps ignores lowercase
opt.incsearch = true -- jumps to what you're searching
opt.cursorline = true -- highlights current line
-- Mouse
opt.mouse = 'a'
-- living dangerously
vim.api.nvim_command("set noswapfile")

-- Don't automatically make more comments lines on enter
vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function() vim.opt.formatoptions =
      vim.opt.formatoptions - { "c", "r", "o" }
    end
  }
)
-- Force syntax on when entering every buffer
vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function()
      vim.cmd [[syntax enable]]
      vim.cmd [[syntax on]]
    end
  }
)
-- Highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost",
  {
    callback = function() vim.highlight.on_yank { higroup = 'Question', timeout = 400 }
    end
  }
)
