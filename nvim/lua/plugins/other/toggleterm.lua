return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = '<C- >',
    insert_mappings = true,
    start_in_insert = true,
    terminal_mappings = true,
    persist_size = true,
    auto_scroll = true,
    shell = vim.o.shell,
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
    close_on_exit = true,
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd('startinsert!')
      vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'x', 'i<C-d>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'r', '<cmd>ToggleTermSetName<CR>', { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd('startinsert!')
    end,
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}
