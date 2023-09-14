return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')

    local function close_all_buffers()
      vim.cmd('wa')
      for _, e in ipairs(bufferline.get_elements().elements) do
        vim.schedule(function()
          vim.cmd('Bdelete ' .. e.id)
        end)
      end
    end

    local function close_buffers_with_no_windows()
      vim.cmd('wa')
      local visible_buf = {}
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        visible_buf[vim.api.nvim_win_get_buf(win)] = true
      end
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if visible_buf[bufnr] == nil then
          vim.cmd('Bdelete ' .. bufnr)
        end
      end
    end

    vim.keymap.set('n', '<leader>qw', close_all_buffers)
    vim.keymap.set('n', '<leader>qn', close_buffers_with_no_windows)

    bufferline.setup({
      options = {
        mode = 'buffers',
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        left_mouse_command = 'buffer %d',
        offsets = {
          {
            filetype = 'NvimTree',
            -- text = function()
            --   return vim.fn.getcwd()
            -- end,
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true,
            -- padding = 0,
          },
        },
        diagnostics = 'nvim_lsp',
        -- function(count, level)
        diagnostics_indicator = function(_, level)
          local icon = level:match('error') and ' ' or ''
          return ' ' .. icon
        end,
        --[[ custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

            if error ~= 0 then
              table.insert(result, { text = "  " .. error, fg = "#EC5241" })
            end

            if warning ~= 0 then
              table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
            end

            if hint ~= 0 then
              table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
            end

            if info ~= 0 then
              table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
            end
            return result
          end,
        }, ]]
      },
    })
  end,
}
