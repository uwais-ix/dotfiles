-- themery.nvim --
return {
  'zaldih/themery.nvim',
  themes = { 'catppuccin', 'rose-pine' },
  init = function()
    require('themery').setup({
      themeConfigFile = '~/.config/nvim/lua/plugins/colorscheme/themery-auto.lua',
      themes = {
        {
          name = 'catppuccin',
          colorscheme = 'catppuccin',
        },
        {
          name = 'catppuccin-frappe',
          colorscheme = 'catppuccin-frappe',
        },
        {
          name = 'catppuccin-latte',
          colorscheme = 'catppuccin-latte',
        },
        {
          name = 'catppuccin-macchiato',
          colorscheme = 'catppuccin-macchiato',
        },
        {
          name = 'catppuccin-mocha',
          colorscheme = 'catppuccin-mocha',
        },
        {
          name = 'icy',
          colorscheme = 'icy',
        },
        {
          name = 'koalight',
          colorscheme = 'koalight',
        },
        {
          name = 'lunar',
          colorscheme = 'lunar',
        },
        {
          name = 'mellow',
          colorscheme = 'mellow',
        },
        {
          name = 'onedark',
          colorscheme = 'onedark',
        },
        {
          name = 'onedarker',
          colorscheme = 'onedarker',
        },
        {
          name = 'onedarkest',
          colorscheme = 'onedarkest',
        },
        {
          name = 'onenord',
          colorscheme = 'onenord',
        },
        {
          name = 'paradox',
          colorscheme = 'paradox',
        },
        {
          name = 'peachpuff',
          colorscheme = 'peachpuff',
        },
        {
          name = 'pywal',
          colorscheme = 'pywal',
        },
        {
          name = 'quiet',
          colorscheme = 'quiet',
        },
        {
          name = 'rose-pine',
          colorscheme = 'rose-pine',
        },
        {
          name = 'rose-pine-dawn',
          colorscheme = 'rose-pine-dawn',
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
          name = 'tone',
          colorscheme = 'tone',
        },
        {
          name = 'tokyonight',
          colorscheme = 'tokyonight',
        },
        {
          name = 'tokyonight-day',
          colorscheme = 'tokyonight-day',
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
