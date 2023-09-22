-- themery.nvim --
return {
  'zaldih/themery.nvim',
  themes = { 'catppuccin', 'rose-pine' },
  init = function()
    require('themery').setup({
      themeConfigFile = '~/.config/nvim/lua/plugins/colorscheme/themery-auto.lua',
      themes = {
        {
          colorscheme = 'aquarium',
          name = 'aquarium',
        },
        {
          colorscheme = 'calvera',
          name = 'calvera',
        },
        {
          name = 'catppuccin',
          colorscheme = 'catppuccin',
        },
        {
          name = 'catppuccin-mocha',
          colorscheme = 'catppuccin-mocha',
        },
        {
          name = 'embark',
          colorscheme = 'embark',
        },
        {
          name = 'everblush',
          colorscheme = 'everblush',
        },
        {
          name = 'mellow',
          colorscheme = 'mellow',
        },
        {
          name = 'oh-lucy',
          colorscheme = 'oh-lucy',
        },
        {
          name = 'oh-lucy-evening',
          colorscheme = 'oh-lucy-evening',
        },
        {
          name = 'onenord',
          colorscheme = 'onenord',
        },
        {
          name = 'oxocarbon',
          colorscheme = 'oxocarbon',
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = 'poimandres',
          colorscheme = 'poimandres',
        },
        {
          name = 'pywal',
          colorscheme = 'pywal',
        },
        {
          name = 'rose-pine-main',
          colorscheme = 'rose-pine-main',
        },
        {
          name = 'rose-pine-moon',
          colorscheme = 'rose-pine-moon',
        },
        {
          name = 'tokyonight-moon',
          colorscheme = 'tokyonight-moon',
        },
        {
          name = 'tokyonight-night',
          colorscheme = 'tokyonight-night',
        },
        {
          name = 'tokyonight-storm',
          colorscheme = 'tokyonight-storm',
        },
      },
    })
  end,
  livePreview = true,
}
