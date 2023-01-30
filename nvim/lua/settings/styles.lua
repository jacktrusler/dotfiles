local colorscheme = 'gruvbox'
local ok, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not ok then
  return
end

local present, colorbuddy = pcall(require, 'colorbuddy')
if not present then
  return
end

local Color, colors, Group, group, styles = colorbuddy.setup()

-- Use Color.new(<name>, <#rrggbb>) to create new colors
-- They can be accessed through colors.<name>
Color.new('dark_blue', '#225577')
Color.new('purple', '#7788dd')
Color.new('background', '#282c34')
Color.new('dark_gray', '#666677')
Color.new('gruv_blue', '#4585aa')
Color.new('red', '#cc6666')
Color.new('light_green', '#99ec99')
Color.new('yellow', '#cc9966')

Group.new('Function', colors.light_green, nil, nil)
-- Group.new('luaFunctionCall', groups.Function, groups.Function, groups.Function)
Group.new('Comment', colors.dark_gray, nil, styles.italic)