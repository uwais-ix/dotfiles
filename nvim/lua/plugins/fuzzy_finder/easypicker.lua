return {
  'axkirillov/easypick.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local easypick = require('easypick')
    easypick.setup({
      pickers = {
        -- list files inside current folder with default previewer
        {
          name = 'ls',
          command = 'ls',
          previewer = easypick.previewers.default(),
        },
        -- list files that have conflicts with diffs in preview
        {
          name = 'conflicts',
          command = 'git diff --name-only --diff-filter=U --relative',
          previewer = easypick.previewers.file_diff(),
        },
      },
    })
  end,
}
