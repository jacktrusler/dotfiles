if vim.g.vscode then
   return
else
   require "plugins"
   require "lspconfig"
   require "settings/options"
   require "settings/keymaps"
   require "settings/styles"
   require "plugins/configs/snippets"
end
