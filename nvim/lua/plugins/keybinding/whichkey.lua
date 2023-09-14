return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
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
    require('which-key').register({
      ['<leader>'] = {
        ['`'] = { 'neoclip' },
        q = {
          name = 'close',
          w = { 'close all buffers: keep layout', noremap = false },
          a = { '<cmd>wall<CR> <cmd>bufdo  :Bdelete <CR>', 'save & close all buffers: discard layout' },
          q = { '<cmd>wall|qa!<CR>', 'save & exit', noremap = false },
          n = { 'close buffers w/ no windows' },
        },
        h = {
          name = 'harpoon',
          o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", 'open harpoon', noremap = false },
          a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", 'mark file', noremap = false },
        },
        ['<leader>'] = {
          name = 'other',
          ['?'] = { '<cmd>Cheatsheet<CR>', 'cheatsheet', noremap = false },
          n = { '<cmd>nohl<CR>', 'nohl', noremap = false },
          t = { '<cmd>Themery<CR>', 'themery', noremap = false },
          i = {
            name = 'info',
            l = { '<cmd>LspInfo<CR>', 'lsp info' },
            n = { '<cmd>NullLsInfo<CR>', 'null-ls info' },
          },
          l = { '<cmd>Lazy<CR>', 'lazy' },
          m = { '<cmd>Mason<CR>', 'mason' },
        },
        d = {
          name = 'diagnostic',
          ['<space>'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'open float', noremap = false },
          n = { '<cmd>lua nvim.diagnostic.goto_next()<CR>', 'next diag', noremap = false },
          p = { '<cmd>lua nvim.diagnostic.goto_prev()<CR>', 'prev diag', noremap = false },
          l = { '<cmd>lua nvim.diagnostic.setloclist()<CR>', 'list diag', noremap = false },
        },
        -- s = {
        -- 	name = "session",
        -- 	l = { "list session", noremap = false },
        -- 	n = { "new session", noremap = false },
        -- 	d = { "delete session", noremap = false },
        -- 	u = { "update session", noremap = false },
        -- },
        f = {
          name = 'file',
          f = { '<cmd>Telescope find_files<CR>', 'find files' },
          g = { '<cmd>Telescope git_files<CR>', 'git files' },
          s = { '<cmd>Telescope live_grep<CR>', 'grep' },
        },
        t = {
          name = 'terminal',
          b = { "<cmd>lua _uwais_toggleterm('btop')<CR>", 'toggle btop', noremap = false },
          h = { "<cmd>lua _uwais_toggleterm('htop')<CR>", 'toggle htop', noremap = false },
          g = { "<cmd>lua _uwais_toggleterm('lazygit')<CR>", 'toggle lazygit', noremap = false },
          n = { "<cmd>lua _uwais_toggleterm('node')<CR>", 'toggle node', noremap = false },
          p = { "<cmd>lua _uwais_toggleterm('python')<CR>", 'toggle python', noremap = false },
          r = { '<cmd>ToggleTermSetName<CR>', 'terminal: rename', noremap = false },
        },
      },
      [' '] = {
        w = { '<cmd>wa<CR>', 'save', noremap = false },
        p = { '<cmd>BufferLinePick<CR>', 'buffer: pick', noremap = false },
        q = { '<cmd>BufferLinePickClose<CR>', 'buffer: pick close', noremap = false },
        v = { '<C-W>v', 'vertical split', noremap = false },
        s = { '<C-W>s', 'horizontal split', noremap = false },
        f = { 'format' },
        D = { 'type definition' },
        t = { '<cmd>TermSelect<CR>', 'terminal: select', noremap = false },
        ['rn'] = { 'buffer rename' },
        ['ca'] = { 'code action' },
        [' '] = { '<cmd>ToggleTermSetName<CR>', 'terminal: rename', noremap = false, mode = 't' },
        x = { '<cmd>w|bdelete<CR>', 'close: write | buffer delete', noremap = false },
      },
      g = {
        name = 'goto',
        D = { 'goto declaration' },
        d = { 'goto definition' },
        i = { 'goto implementation' },
        r = { 'goto references' },
      },
    })
  end,
}
