local signs = {
  { name = 'DapBreakpoint', text = '' },
  { name = 'DapBreakpointCondition', text = 'ﳁ' },
  { name = 'DapLogPoint', text = '' },
  { name = 'DapStopped', text = '' },
  { name = 'DapBreakpointRejected', text = '' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name, linhl = sign.name })
end
