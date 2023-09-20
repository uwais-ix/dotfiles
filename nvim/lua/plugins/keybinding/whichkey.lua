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
      -- leader --
      ['<leader>'] = {
        -- close --
        q = {
          name = 'close',
          w = { 'close all buffers: keep layout', noremap = false },
          a = { '<cmd>wall<CR> <cmd>bufdo  :bdelete <CR>', 'save & close all buffers: discard layout' },
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
          h = { '<cmd>Cheatsheet<CR>', 'cheatsheet', noremap = false },
          c = {
            name = 'ChatGPT',
            c = { '<cmd>ChatGPT<CR>', 'ChatGPT' },
            e = { '<cmd>ChatGPTEditWithInstruction<CR>', 'Edit with instruction', mode = { 'n', 'v' } },
            g = { '<cmd>ChatGPTRun grammar_correction<CR>', 'Grammar Correction', mode = { 'n', 'v' } },
            t = { '<cmd>ChatGPTRun translate<CR>', 'Translate', mode = { 'n', 'v' } },
            k = { '<cmd>ChatGPTRun keywords<CR>', 'Keywords', mode = { 'n', 'v' } },
            d = { '<cmd>ChatGPTRun docstring<CR>', 'Docstring', mode = { 'n', 'v' } },
            a = { '<cmd>ChatGPTRun add_tests<CR>', 'Add Tests', mode = { 'n', 'v' } },
            o = { '<cmd>ChatGPTRun optimize_code<CR>', 'Optimize Code', mode = { 'n', 'v' } },
            s = { '<cmd>ChatGPTRun summarize<CR>', 'Summarize', mode = { 'n', 'v' } },
            f = { '<cmd>ChatGPTRun fix_bugs<CR>', 'Fix Bugs', mode = { 'n', 'v' } },
            x = { '<cmd>ChatGPTRun explain_code<CR>', 'Explain Code', mode = { 'n', 'v' } },
            r = { '<cmd>ChatGPTRun roxygen_edit<CR>', 'Roxygen Edit', mode = { 'n', 'v' } },
            l = { '<cmd>ChatGPTRun code_readability_analysis<CR>', 'Code Readability Analysis', mode = { 'n', 'v' } },
          },
          ['?'] = { '<cmd>DocsViewToggle<CR>', '', noremap = false },
          t = { '<cmd>Themery<CR>', 'themery', noremap = false },
          d = { '<cmd>lua require("notify").dismiss()<CR>', 'notify: dismiss', noremap = true },
          i = {
            name = 'info',
            l = { '<cmd>LspInfo<CR>', 'lsp info' },
            n = { '<cmd>NullLsInfo<CR>', 'null-ls info' },
          },
          l = { '<cmd>Lazy<CR>', 'lazy' },
          m = { '<cmd>Mason<CR>', 'mason' },
          w = {
            name = 'workspace',
            a = { 'workspace: add folder' },
            r = { 'workspace: remove folder' },
            l = { 'workspace: list folder' },
          },
        },
        -- dap --
        d = {
          name = 'dap',
          ['so'] = { '<cmd>DapStepOver<CR>', 'dap: step over', noremap = false },
          ['si'] = { '<cmd>DapStepInto<CR>', 'dap: step into', noremap = false },
          ['sx'] = { '<cmd>DapStepOut<CR>', 'dap: step out', noremap = false },
          x = { '<cmd>DapTerminate<CR>', 'dap: terminate', noremap = false },
          b = { '<cmd>DapToggleBreakpoint<CR>', 'dap: toggle breakpoint', noremap = false },
          B = { '<cmd>lua require("dap").set_breakpoint()<CR>', 'dap: set breakpoint', noremap = false },
          t = { '<cmd>lua require("dapui").toggle()<CR>', 'dap-ui: toggle', noremap = false },
        },
        -- session --
        s = {
          name = 'session',
          l = { 'list session', noremap = false },
          n = { 'new session', noremap = false },
          d = { 'delete session', noremap = false },
          u = { 'update session', noremap = false },
        },
        -- find --
        f = {
          name = '+find',
          f = { '<cmd>Telescope find_files initial_mode=insert<CR>', 'find files' },
          g = { '<cmd>Telescope git_files initial_mode=insert<CR>', 'git files' },
          ['<space>'] = { '<cmd>Telescope live_grep initial_mode=insert<CR>', 'grep' },
        },
        -- terminal --
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
      -- space --
      ['<space>'] = {
        w = { '<cmd>wa<CR>', 'save', noremap = false },
        p = { '<cmd>BufferLinePick<CR>', 'buffer: pick', noremap = false },
        q = { '<cmd>wa|BufferLinePickClose<CR>', 'buffer: pick close', noremap = false },
        v = { '<C-W>v', 'vertical split', noremap = false },
        s = { '<C-W>s', 'horizontal split', noremap = false },
        f = { 'format' },
        D = { 'type definition' },
        ['<leader>'] = { '<cmd>TermSelect<CR>', 'terminal: select', noremap = false },
        h = { '<cmd>TroubleToggle<CR>', 'trouble: toggle', noremap = false },
        t = {
          'telescope',
          r = { '<cmd>Telescope registers initial_mode=normal<CR>', 'telescope: registers' },
          d = { '<cmd>Telescope diagnostics initial_mode=normal<CR>', 'telescope: diagnostic' },
          b = { '<cmd>Telescope buffers initial_mode=normal<CR>', 'telescope: buffers' },
          s = {
            'symbols',
            w = { '<cmd>Telescope lsp_workspace_symbols initial_mode=normal<CR>', 'workspace symbols' },
            d = { '<cmd>Telescope lsp_document_symbols initial_mode=normal<CR>', 'document symbols' },
          },
          t = { '<cmd>Telescope<CR>', 'telescope' },
          a = {
            name = 'agrolens: todo',
            f = { '<cmd> Telescope agrolens query=functions initial_mode=normal' },
            fa = { '<cmd> Telescope agrolens query=functions buffers=all initial_mode=normal' },
          },
        },
        ['rn'] = { 'buffer rename' },
        ['ca'] = { 'code action' },
        x = { '<cmd>w|Bdelete<CR>', 'close: write | buffer delete', noremap = false },
        ['<space>'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'open float', noremap = false },
      },
      -- goto --
      g = {
        name = 'goto',
        D = { 'goto declaration' },
        d = { 'goto definition' },
        i = { 'goto implementation' },
        r = { 'goto references' },
      },
      gp = { name = 'goto-preview' },
    })
  end,
}
