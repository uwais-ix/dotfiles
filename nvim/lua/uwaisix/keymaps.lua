local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- nohl
keymap('n', '<esc>', ':nohl<CR>', { noremap = false, silent = true })
-- enter insert mode
keymap('i', 'jk', '<esc>', { noremap = false })
keymap('i', 'kj', '<esc>', { noremap = false })
--
-- nvim tree
keymap('n', '<C-n>', ':NvimTreeFocus<CR>', opts)
--
-- window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
-- resize
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)
-- buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)
--
keymap('n', '<C-b>', '^', opts)
keymap('n', '<C-e>', '$', opts)
-- winodw
keymap('n', 'qq', '<C-w>q', opts)
-- end --

-- visual --
-- move block
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
-- stay in indent mode
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)
-- prevent copy item being paseted in visual mode
keymap('v', 'p', '"_dP', opts)
-- end --

-- terminal --
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<leader><esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

require('plugins.keybinding.term_bindings')
require('plugins.keybinding.venn')

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd("autocmd TermClose * execute 'close!'")
-- end --
