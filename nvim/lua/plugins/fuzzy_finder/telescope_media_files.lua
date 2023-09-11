return {
  'nvim-telescope/telescope-media-files.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    require 'telescope'.setup {
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg", "webm", "mp4", "pdf" },
          -- find command (defaults to `fd`)
          find_cmd = "fd"
        }
      },
    }
  end
}
