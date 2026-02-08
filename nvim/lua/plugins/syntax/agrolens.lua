return {
  'desdic/agrolens.nvim',
  dependencies = 'nvim-telescope/telescope.nvim',
  config = function()
    require('telescope').load_extension('agrolens')
  end,
  -- @todo
}
