return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'jvgrootveld/telescope-zoxide',
    'debugloop/telescope-undo.nvim',
  },

  config = function()
    local z_utils = require('telescope._extensions.zoxide.utils')
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        prompt_prefix = '  ',
        initial_mode = 'normal',
      },
      extensions = {
        zoxide = {
          prompt_title = '[ --? ]',
          mappings = {
            default = {
              after_action = function(selection)
                print('Update to (' .. selection.z_score .. ') ' .. selection.path)
              end,
            },
            ['<C-s>'] = {
              before_action = function(selection)
                print('before C-s')
              end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end,
            },
            -- Opens the selected entry in a new split
            ['<C-q>'] = { action = z_utils.create_basic_command('split') },
          },
        },
        undo = {
          -- telescope-undo.nvim config, see below
          use_delta = true,
          use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
          side_by_side = false,
          vim_diff_opts = {
            ctxlen = vim.o.scrolloff,
          },
          entry_format = 'state #$ID, $STAT, $TIME',
          time_format = '',
          mappings = {
            i = {
              ['<C-r>'] = require('telescope-undo.actions').restore,
              ['<S-cr>'] = require('telescope-undo.actions').yank_deletions,
              ['<C-cr>'] = require('telescope-undo.actions').yank_addition,
            },
            n = {
              ['<S-cr>'] = require('telescope-undo.actions').yank_deletions,
              ['<C-cr>'] = require('telescope-undo.actions').yank_additions,
              ['<C-r>'] = require('telescope-undo.actions').restore,
            },
          },
        },
      },
    })
    telescope.load_extension('zoxide')
    telescope.load_extension('undo')
  end,

  keys = {
    -- { '<leader>ff', function() require 'telescope.builtin'.find_files() end },
    -- { '<leader>fg', function() require 'telescope.builtin'.git_files() end },
    -- { '<leader>gg', function() require 'telescope.builtin'.live_grep() end },
    {
      '<C-p>',
      function()
        require('telescope').extensions.projects.projects({})
      end,
    },
    {
      '<leader>`',
      function()
        vim.cmd('Telescope neoclip')
      end,
    },
    {
      '<leader>fz',
      function()
        require('telescope').extensions.zoxide.list()
      end,
    },
  },
}
