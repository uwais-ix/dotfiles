return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require('mason-lspconfig').setup({
      automatic_installation = true,
      handlers = nil,
    })
    require('mason-lspconfig').setup_handlers {
      -- default handler
      function(server_name)
        require('lspconfig')[server_name].setup {}
      end,

      -- override hanlder
      -- [lspconfig_name] = function() --code end
    }
  end
}
