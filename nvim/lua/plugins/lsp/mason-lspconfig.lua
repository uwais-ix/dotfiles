return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require('plugins.lsp.vim_diagnostics')
    require('plugins.lsp.lsp_keymaps')

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })

    require('mason-lspconfig').setup({
      automatic_installation = true,
    })
    -- deprecated
    -- require('mason-lspconfig').setup_handlers({
    --   -- default handler
    --   function(server_name)
    --     require('lspconfig')[server_name].setup({})
    --   end,

    --   -- override hanlder
    --   -- [lspconfig_name] = function() --code end
    -- })
  end,
}
