local options = {
  clipboard = 'unnamedplus',
  ignorecase = true,
  smartcase = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local code = require('vscode')

vim.keymap.set({ 'n' }, "gh", function()
  code.action('workbench.action.navigateBack')
end)

vim.keymap.set({ 'n' }, "gl", function()
  code.action('workbench.action.navigateForward')
end)
