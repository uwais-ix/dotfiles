return { -- bg.nvim --
  {
    'typicode/bg.nvim',
    lazy = false,
  },
  --
  {
    'AlphaTechnolog/pywal.nvim',
    name = 'pywal',
    config = function()
      require('pywal').setup()
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        -- background = { -- :h background
        -- light = "latte",
        -- dark = "mocha",
        -- },
        -- transparent_background = false, -- disables setting the background color.
        -- show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = { 'italic' },
          loops = { 'bold' },
          functions = { 'bold' },
          keywords = { 'italic' },
          strings = {},
          variables = {},
          numbers = {},
          booleans = { 'bold', 'italic' },
          properties = { 'italic' },
          types = {},
          operators = { 'bold' },
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          telescope = {
            enabled = true,
            style = 'nvchad'
          },
          treesitter = true,
          alpha = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
            },
            inlay_hints = {
              background = true,
            },
          },
        },
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        cmp = true,
        mason = false,
        mini = false,
        gitsigns = true,
        which_key = false,
        neotree = false,
        noice = false,
        nvimtree = true,
        notify = false,
        harpoon = false,
        lsp_trouble = false,
      })
    end,
  },
  {
    'rose-pine/nvim',
    name = 'rose-pine',
  },
  {
    'lunarvim/colorschemes',
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
  },
  {
    'elianiva/icy.nvim',
  },
  {
    'kvrohit/mellow.nvim',
  },
  {
    'cseelus/nvim-colors-tone',
  },
  {
    'Koalhack/koalight.nvim',
  },
  {
    'nvimdev/paradox.vim',
  },
}
