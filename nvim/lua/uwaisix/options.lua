-- options --
-- https://neovim.io/doc/user/options.html#option-summary
local options = {
  --
  clipboard = "unnamedplus",
  fileencoding = "utf-8",
  updatetime = 100,
  confirm = true,
  completeopt = { "menuone", "noselect" },
  splitbelow = true,
  splitright = true,
  --
  ignorecase = true,
  incsearch = true,
  hlsearch = true,
  --
  swapfile = false,
  backup = true,
  backupdir = os.getenv("HOME") .. "/.nvim/backup",
  undofile = true,
  undodir = os.getenv("HOME") .. "/.nvim/undo",
  --
  relativenumber = true,
  nu = true,
  --
  showbreak = ">> ",
  --
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  --
  scrolloff = 8,
  signcolumn = "yes",
  --
  modifiable = true,
  -- guifont = "monospace:h17",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.iskeyword:append "-"
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
require('plugins.colorscheme.themery-auto')
