---@diagnostic disable: undefined-global

-- Spelling
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'text', 'tex', 'gitcommit' },
  callback = function() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.spell = true
  end,
})

-- CSHTML
vim.filetype.add {
  extension = {
    cshtml = 'razor',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'razor',
  callback = function()
    vim.bo.commentstring = '@* %s *@'
  end,
})

-- Common mistypes ...
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cnoreabbrev cc CodeCompanion]]
