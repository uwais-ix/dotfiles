function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == 'nil' then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, 'n', '<down>', '<C-v>j:VBox<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<up>', '<C-v>k:VBox<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<right>', '<C-v>l:VBox<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<left>', '<C-v>h:VBox<CR>', { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, 'v', 'f', ':VBox<CR>', { noremap = true })
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
  end
end

-- toggle keymappings for venn using <leader>v
-- vim.api.nvim_set_keymap('n', '<leader>v', ':lua Toggle_venn()<CR>', { noremap = true })
