return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  opts = {
    ensure_installed = {
      'javascript',
      'typescript',
      'tsx',
      'json',
      'bash',
      'css',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    },
  },
  auto_install = false,
  build = ':TSUpdate',
}
