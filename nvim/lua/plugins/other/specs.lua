return {
  'edluffy/specs.nvim',
  config = function()
    require('specs').setup({
      show_jumps = true,
      min_jump = 30,
      popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10,  -- time increments used for fade/resize effects
        blend = 10,   -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = 'PMenu',
        fader = require('specs').empty_fader,
        resizer = require('specs').shrink_resizer,
      },
      ignore_filetypes = {},
      ignore_buftypes = {
        nofile = true,
      },
    })

    --     Faders:
    --
    -- sinus_fader ⌣/⌢\⌣/⌢\⌣/⌢\⌣/⌢
    --
    -- linear_fader ▁▂▂▃▃▄▄▅▅▆▆▇▇██
    --
    -- exp_fader ▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇
    --
    -- pulse_fader ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁
    --
    -- empty_fader ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    --
    -- Resizers:
    --
    -- shrink_resizer ░░▒▒▓█████▓▒▒░░
    --
    -- slide_resizer ████▓▓▓▒▒▒▒░░░░
    --
    -- empty_resizer ███████████████

    vim.api.nvim_set_keymap('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'k', 'k:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'j', 'j:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'l', 'l:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'h', 'h:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
  end,
}
