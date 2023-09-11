return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require("which-key").register({
      q = {
        name = "quit",
        p = { "", "Buffer: Pick Close"}
      },
      ["<leader>"] = {
        ["<leader>"] = { "<cmd>BufferLinePick<CR>", "Buffer: Pick" },
      },
    })
  end,
}
