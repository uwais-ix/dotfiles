return {
  'toppair/reach.nvim',
  -- default config
  config = function()
    require('reach').setup({
      notifications = true,
    })
  end,
}

--[[
space -> delete
cr -> goto
| -> vertical split
- -> horizontal split
] -> open in new tab
]]
