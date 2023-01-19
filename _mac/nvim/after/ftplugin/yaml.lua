local opt = vim.opt

opt.cursorcolumn = true

local colorscheme = "monokai"
local ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not ok then
  print("error setting colorscheme")
end
