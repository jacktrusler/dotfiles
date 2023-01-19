local opts = { noremap = true, silent = true }

-- Shorten keymap nvim call
local keymap = vim.api.nvim_set_keymap

-- Rekeymap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes:
--   Normal       = "n"
--   Insert       = "i"
--   Visual       = "v"
--   Visual_Block = "x"
--   Terminal     = "t"
--   Command      = "c"

keymap("n", ",edit", ":edit $MYVIMRC<CR>", opts)
keymap("n", ",s", ":w<CR>:so%<CR>", opts)
keymap("n", "<leader>c", ":cclose<CR>", opts)

-- Debugging
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", ",so", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", ",si", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", ",b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
-- Copying without linenumbers, turning mouse off to copy
keymap("n", ",c", ":set nonumber norelativenumber mouse=\"\"<CR>", { noremap = true })
keymap("n", ",C", ":set number relativenumber mouse=a<CR>", { noremap = true })
--Window Movement and Filetree
keymap("n", ",w", "<C-w>w", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>V", ":Vexplore<CR>", opts)
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>S", ":Sex<CR>", opts)
keymap("n", "<leader>e", ":Explore<CR>", opts)
keymap("n", "<leader>q", ":Neotree <CR>", opts)
keymap("n", "<leader>Q", ":Neotree <C-R>=expand('%:h')<CR><CR>", opts)
keymap("n", "<leader>/", ":Neotree toggle reveal_force_cwd<CR>", opts)
keymap("n", "<leader>br", ":Neotree toggle buffers right<CR>", opts)
keymap("n", "<leader>git", ":Neotree float git_status<CR>", opts)
-- Buffers & Terminal
keymap("n", "<TAB>", ":bn<CR>", opts)
keymap("n", "<S-TAB>", ":bp<CR>", opts)
keymap("n", "<leader>nb", ":set nomore <Bar> :ls <Bar> :set more <CR>:Vexplore<CR>:b<Space>", opts)
keymap("n", "<leader>t", ":botright vsplit | term <CR>a", opts)
keymap("n", ",t", ":botright 16split | term <CR>a", opts)
keymap("n", "<leader>d", ":bp | sp | bn | bd<CR>", opts)
keymap("n", "<leader>bo", ":%bd|e#|bd# <CR>", opts)
keymap("t", "<Esc>", '<C-\\><C-N>', opts)
keymap("t", "<C-D>", '<C-\\><C-N>:q!<CR>', opts)
-- Telescopic Johnson
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
keymap('n', '<leader>fh', ":Telescope help_tags<CR>", { noremap = true })
keymap("n", "<leader>fg", ":Telescope git_files<CR>", { noremap = true })
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", { noremap = true })
keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", { noremap = true })
-- pasting from and yanking to "+ register (clipboard)
keymap("n", "<leader>p", '"+p', opts)
keymap("x", "<leader>p", '"+p', opts)
keymap("v", "<leader>y", '"+y', opts)

-- misc
keymap("x", "<leader>p", '"_dP', opts) -- delete register to paste multiple times
keymap("n", "<C-u>", "<C-u>zz", opts) -- center page when moving up
keymap("n", "<C-d>", "<C-d>zz", opts) -- center page when moving down

keymap("c", "%%", "<C-R>=expand('%:h')<CR>", opts)
keymap("c", "<C-k>", "<Up>", opts)


-- Wrapper to look at tables (objects) with vim.inspect
function P(table)
  print(vim.inspect(table))
  return table
end
