---@diagnostic disable: undefined-global

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text', 'tex', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
  end,
})
--
-- Common mistypes ...
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

-- Emmet
vim.cmd [[let g:user_emmet_settings = {
      \  'variables': {'lang': 'en'},
      \  'html': {
      \    'default_attributes': {
      \      'option': {'value': v:null},
      \      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
      \    },
      \    'snippets': {
      \      'html:5': "<!DOCTYPE html>\n"
      \              ."<html lang=\"${lang}\">\n"
      \              ."<head>\n"
      \              ."\t<meta charset=\"${charset}\"/>\n"
      \              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n"
      \              ."\t<title>Change me</title>\n"
      \              ."</head>\n"
      \              ."<body>\n\t${child}|\n</body>\n"
      \              ."</html>",
      \    },
      \  },
      \}]]

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
