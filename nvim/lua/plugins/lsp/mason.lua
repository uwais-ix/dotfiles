return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      log_level = vim.log.levels.DEBUG,
      max_concurrent_installers = 4,
    });
  end
}
