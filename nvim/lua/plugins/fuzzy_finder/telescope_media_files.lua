return {
  'nvim-telescope/telescope-media-files.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'webm', 'mp4', 'pdf' },
          -- find command (defaults to `fd`)
          find_cmd = 'fd',
        },
      },
    })
    telescope.load_extension('media_files')
  end,
}
