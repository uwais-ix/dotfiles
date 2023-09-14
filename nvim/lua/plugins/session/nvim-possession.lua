return {
  'gennaro-tedesco/nvim-possession',
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  config = function()
    local possession = require('nvim-possession')
    possession.setup({
      sessions = {
        sessions_path = vim.fn.stdpath('data') .. '/sessions/',
        --sessions_variable = ...,
        --sessions_icon = ...
      },
      autoload = false,
      autosave = true,
      autoswitch = {
        enable = true,
        -- exclude_ft = {},
      },
      save_hook = function() end,
      post_hook = function()
        vim.cmd('NvimTreeToggle')
        -- vim.cmd("ToggleTerm")
        local buflist = vim.api.nvim_list_bufs()
        for _, bufnr in ipairs(buflist) do
          local name = vim.api.nvim_buf_get_name(bufnr)
          local is_dir = vim.fn.isdirectory(name)
          if is_dir == 1 then
            vim.cmd('bwipeout ' .. bufnr)
          end
        end
      end,
      fzf_winopts = {
        -- any valid fzf-lua winopts options, for instance
        width = 0.7,
        preview = {
          vertical = 'right:50%',
        },
      },
    })
    vim.keymap.set('n', '<leader>sl', function()
      possession.list()
    end)
    vim.keymap.set('n', '<leader>sn', function()
      possession.new()
    end)
    vim.keymap.set('n', '<leader>su', function()
      possession.update()
    end)
    vim.keymap.set('n', '<leader>sd', function()
      possession.delete()
    end)
  end,
}
