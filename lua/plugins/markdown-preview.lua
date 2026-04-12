return {
  'iamcco/markdown-preview.nvim',
  lazy = true,
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_browser = 'firefox.desktop'
  end,
  ft = { 'markdown' },
}
