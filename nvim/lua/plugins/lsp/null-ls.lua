return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local codeactions = null_ls.builtins.code_actions
    local eslint = require("none-ls.diagnostics.eslint")

    null_ls.setup({
      sources = {
        formatting.prettierd.with({}),
        formatting.black.with({ extra_args = { '--fast' } }),
        formatting.stylua.with({
          extra_args = { '--indent-type=Spaces', '--quote-style=AutoPreferSingle', '--indent-width=2' },
        }),
        formatting.clang_format.with({}),
        eslint.with({})
        -- codeactions.eslint_d.with({}), @deprecated?
      },
    })
  end,
}
