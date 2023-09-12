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
      ["<leader>"] = {
        ["`"] = { "neoclip" },
        q = {
          name = "close",
          w = { "close all buffers: keep layout", noremap = false },
          a = { "<cmd>wa<CR> <cmd>bufdo  :Bdelete <CR>", "save & close all buffers: discard layout" },
          q = { "<cmd>wqa<CR>", "save & exit", noremap = false },
          n = { "close buffers w/ no windows" },
        },
        ["<leader>"] = {
          name = "other",
          n = { "<cmd>nohl<CR>", "nohl", noremap = false },
        },
        d = {
          name = "diagnostic",
          ["<space>"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "open float", noremap = false },
          n = { "<cmd>lua nvim.diagnostic.goto_next()<CR>", "next diag", noremap = false },
          p = { "<cmd>lua nvim.diagnostic.goto_prev()<CR>", "prev diag", noremap = false },
          l = { "<cmd>lua nvim.diagnostic.setloclist()<CR>", "list diag", noremap = false },
        },
        s = {
          name = "session",
          l = { "list session", noremap = false },
          n = { "new session", noremap = false },
          d = { "delete session", noremap = false },
          u = { "update session", noremap = false },
        },
        f = {
          name = "file",
          f = { "<cmd>Telescope find_files<CR>", "find files" },
          g = { "<cmd>Telescope git_files<CR>", "git files" },
          s = { "<cmd>Telescope live_grep<CR>", "grep" },
        },
      },
      [" "] = {
        w = { "<cmd>wa<CR>", "save", noremap = false },
        p = { "<cmd>BufferLinePick<CR>", "buffer: pick", noremap = false },
        q = { "<cmd>BufferLinePickClose<CR>", "buffer: pick close", noremap = false },
        v = { "<C-W>v", "vertical split", noremap = false },
        s = { "<C-W>s", "horizontal split", noremap = false },
        f = { "format" },
        D = { "type definition" },
        ["rn"] = { "buffer rename" },
        ["ca"] = { "code action" },
      },
      g = {
        name = "goto",
        D = { "goto declaration" },
        d = { "goto definition" },
        i = { "goto implementation" },
        r = { "goto references" },
      },
    })
  end,
}
