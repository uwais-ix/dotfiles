return {
  'luukvbaal/statuscol.nvim',
  config = function()
    -- local builtin = require("statuscol.builtin")
    require('statuscol').setup({
      clickHandlers = {
        Lnum = false,
        DiagnosticSignError = false,
        DiagnosticSignHint = false,
        DiagnosticSignInfo = false,
        DiagnosticSignWarn = false,
        GitSignsTopdelete = false,
        GitSignsUntracked = false,
        GitSignsAdd = false,
        GitSignsChange = false,
        GitSignsChangedelete = false,
        GitSignsDelete = false,
        gitsigns_extmark_signs_ = false,
        FoldClose = false,
        FoldOpen = false,
        FoldOther = false,
      },
    })
  end,
}
