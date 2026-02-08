return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.buttons.val = {
      dashboard.button('n', '  New File', '<cmd>ene <CR>'),
      dashboard.button('<leader>ff', '󰈞  Find File'),
      dashboard.button('<leader>f<space>', '󰈭  Grep'),
      dashboard.button('r', '  Recent Files', '<cmd>Telescope oldfiles initial_mode=normal<CR>'),
      dashboard.button('<leader>sl', '  Sessions'),
      dashboard.button('<C-p>', '󱔘  Projects'),
      dashboard.button('q', '  Exit', '<cmd>q <CR>'),
    }

    alpha.setup(dashboard.config)
  end,
}
