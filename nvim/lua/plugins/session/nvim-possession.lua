return {
  "gennaro-tedesco/nvim-possession",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  config = function()
    local possession = require("nvim-possession")
    possession.setup({
      sessions = {
        sessions_path = vim.fn.stdpath('data') .. '/sessions/',
        --sessions_variable = ...,
        --sessions_icon = ...
      },
      autoload = false,
      autosave = true,
      autoswitch = {
        enable = false,
        exclude_ft = {},
      },
      save_hook = nil,
      post_hook = nil,
      fzf_winopts = {
        -- any valid fzf-lua winopts options, for instance
        width = 0.7,
        preview = {
          vertical = "right:50%"
        }
      }
    })
    vim.keymap.set("n", "<leader>sl", function() possession.list() end)
    vim.keymap.set("n", "<leader>sn", function() possession.new() end)
    vim.keymap.set("n", "<leader>su", function() possession.update() end)
    vim.keymap.set("n", "<leader>sd", function() possession.delete() end)
  end,
}
