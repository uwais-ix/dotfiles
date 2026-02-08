require('plugin_manager')

if not vim.g.vscode then
  require('uwaisix.options')
  require('uwaisix.keymaps')
else
  require('uwaisix.vscode_options')
end

