return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 80,      -- or 0.85 for percentage
      options = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
    },
    plugins = {
      twilight = { enabled = true }, -- dim non-focused code
      tmux = { enabled = true },
    },
  },
}
