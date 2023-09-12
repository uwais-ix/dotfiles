return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		-- { '<leader>ff', function() require 'telescope.builtin'.find_files() end },
		-- { '<leader>fg', function() require 'telescope.builtin'.git_files() end },
		-- { '<leader>gg', function() require 'telescope.builtin'.live_grep() end },
		{ '<C-p>', function()
			require 'telescope'.extensions.projects.projects {}
		end },
		{ '<leader>`', function()
			vim.cmd('Telescope neoclip')
		end }
	}
}
