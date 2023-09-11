return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      -- :h nvim-surround.usage
      -- require('lua.plugins.nvim-surround_config')
    })
  end
}
