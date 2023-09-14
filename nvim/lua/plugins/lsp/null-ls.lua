return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion

    null_ls.setup({
      sources = {
        formatting.prettier.with({
          extra_args = { '', '--no-semi=true', '--single-quote=true', '--jsx-single-quote' },
        }),
        formatting.black.with({ extra_args = { '--fast' } }),
        formatting.stylua.with({
          extra_args = { '--indent-type=Spaces', '--quote-style=AutoPreferSingle', '--indent-width=2' },
        }),
        -- diagnostics.eslint,
        -- completion.spell
      },
    })
  end,
}
