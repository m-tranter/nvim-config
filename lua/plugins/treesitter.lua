return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  priority = 1000,
  build = ':TSUpdate',
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
      'vue',
    },
    highlight = {
      enable = true,
    },
    auto_install = true,
  },
}
