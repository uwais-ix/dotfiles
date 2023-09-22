-- @todo 
-- wait for plugin login fix
-- https://github.com/stevearc/gkeep.nvim/issues/13#issuecomment-1252209227
return {
  'stevearc/gkeep.nvim',
  build = 'UpdateRemotePlugins',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
