return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {}, -- this is equalent to setup({}) function
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { 'TelescopePrompt', 'vim' },
    })
  end,
}
