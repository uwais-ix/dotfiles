return {
  'axkirillov/easypick.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    local easypick = require 'easypick'
    easypick.setup({
      pickers = {
        {
          name = 'ls',
          command = 'ls',
          previewer = easypick.previewers.default()
        },
      },
    })
  end
}
