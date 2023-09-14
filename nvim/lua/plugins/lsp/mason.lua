return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
      pip = {
        ---@since 1.0.0
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = true,

        ---@since 1.0.0
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
      },
      log_level = vim.log.levels.DEBUG,
      max_concurrent_installers = 4,
    })
  end,
}
