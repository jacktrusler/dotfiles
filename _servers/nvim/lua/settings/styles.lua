local colorscheme = 'melange'
local ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not ok then
  return
end
