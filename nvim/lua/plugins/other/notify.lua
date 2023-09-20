return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      fps = 60,
      timeout = 1800,
    })
    vim.notify = require('notify')
  end,
}
