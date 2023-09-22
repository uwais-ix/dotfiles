return {
  'Dhanus3133/LeetBuddy.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('leetbuddy').setup({
      domain = 'com',
      language = 'js', -- cpp, py, c, cs, rb, go, kt, rs, php, ts,.. ?refer docs for more
    })
  end,
  keys = {
    { '<leader>lq', '<cmd>LBQuestions<cr>', desc = 'List Questions' },
    { '<leader>ll', '<cmd>LBQuestion<cr>',  desc = 'View Question' },
    { '<leader>lr', '<cmd>LBReset<cr>',     desc = 'Reset Code' },
    { '<leader>lt', '<cmd>LBTest<cr>',      desc = 'Run Code' },
    { '<leader>ls', '<cmd>LBSubmit<cr>',    desc = 'Submit Code' },
  },
}

--[[ 
LBQuestions: Lists all Leetcode problems with submission status and difficulty level. Additionally, there are custom filters available to further refine the displayed problems:
  <A-r>: Reset all filters and display all problems.
  <A-e>: Display only easy difficulty problems.
  <A-m>: Display only medium difficulty problems.
  <A-h>: Display only hard difficulty problems.
  <A-a>: Display only problems with a status of "Accepted" (AC).
  <A-y>: Display only problems with a status of "Not Started" (NOT_STARTED).
  <A-t>: Display only problems with a status of "Tried" (TRIED).
LBQuestion: Displays the question in a popup window.
LBReset: Resets the code of the current question to the default template.
LBTest: Runs the test cases for the current question. Multiple test cases can be added.
LBSubmit: Submits the code for the current question.
LBChangeLanguage: Dynamically switch the language for the current problem.
]]
