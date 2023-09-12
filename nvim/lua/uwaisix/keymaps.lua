local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- keymap("n", "<leader> ", vim.cmd.Ex, opts)
-- keymap("n", "<leader>e", ":Lex 30<CR>", opts)
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
-- keymap("n", "<leader><leader>", ":nohl<CR>", opts)

keymap("n", "<C-n>", ":NvimTreeFocus<CR>")
--
-- window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- resize
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- end --

-- visual --
-- move block
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "p", '"_dP', opts)
-- end --

-- terminal --
-- local termopts = { silent = true }
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- end --
