---@diagnostic disable: undefined-global
vim.keymap.set({ 'c', 'i' }, '<M-b>', '`', { desc = 'Backtick' })
vim.keymap.set('n', 'r<M-b>', 'r`', { desc = 'backtick replace' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search highlights' })
vim.keymap.set('', '<up>', '<nop>', { noremap = true })
vim.keymap.set('', '<down>', '<nop>', { noremap = true })
vim.keymap.set('i', '<up>', '<nop>', { noremap = true })
vim.keymap.set('i', '<down>', '<nop>', { noremap = true })
vim.keymap.set('n', '<C-down>', 'ddp', { desc = 'Move line down' })
vim.keymap.set('n', '<C-up>', 'ddkP', { desc = 'Move line up' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<Leader>w', '<C-w>v', { desc = 'Vertical split' })
vim.keymap.set('n', '<Leader>o', '<Cmd>Obsidian<CR>', { desc = 'Obsidian' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down and recenter' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search item and recenter' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search item and recenter' })
vim.keymap.set('n', '<Leader>P', '"_dP', { desc = 'Paste without clobber' })
vim.keymap.set('x', '<Leader>p', '"_dp', { desc = 'Paste without clobber' })
vim.keymap.set({ 'n', 'v', 'o' }, 'Q', '<Nop>', { desc = 'Disable Q' })
vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>', { desc = 'Neotree' })
vim.keymap.set('n', '<Leader>a', 'ggVG$', { desc = 'Select entire buffer' })
vim.keymap.set('v', ',,', function()
  vim.lsp.buf.code_action {
    filter = function(action)
      return action.title:match 'Emmet'
    end,
    apply = true,
  }
end, { desc = 'Emmet wrap with abbreviation' })

-- Code companion
vim.keymap.set({ 'n', 'v' }, '<Leader>ci', '<cmd>CodeCompanion<cr>', { desc = 'Inline code companion', noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', { desc = 'CC actions', noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>i', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CC chat', noremap = true, silent = true })
vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { desc = 'Send selection to CC', noremap = true, silent = true })

vim.keymap.set('n', '<Leader>d', function()
  require('codecompanion').prompt 'do_task'
end, { noremap = true, silent = true })
