return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        offsets = {
          {
            filetype = "NvimTree",
            -- text = function()
            --   return vim.fn.getcwd()
            -- end,
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
            -- padding = 0,
          },
        },
        diagnostics = "nvim_lsp",
        -- function(count, level)
        diagnostics_indicator = function(_, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon
        end,
      },
    })
  end,
}
