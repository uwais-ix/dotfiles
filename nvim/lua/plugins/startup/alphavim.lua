return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.buttons.val = {
      dashboard.button('n', '  New File', '<cmd>ene <CR>'),
      dashboard.button('<leader>sl', '󰺿  Sessions'),
      dashboard.button('<C-p>', '󰺿  Projects'),
      dashboard.button('<leader>ff', '󰈞  Find File'),
      dashboard.button('<leader>gg', '󰈭  Grep'),
    }

    alpha.setup(dashboard.config)
  end,
}
