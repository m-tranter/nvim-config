return {
  rocks = {
    enabled = false,
  },
  spec = {
    { import = 'plugins' },
    { 'ethanholz/nvim-lastplace', opts = {} },
    {
      'folke/ts-comments.nvim',
      event = 'VeryLazy',
      opts = {},
    },
    {
      'mrcjkb/rustaceanvim',
      lazy = true,
    },
    { 'nvchad/nvim-colorizer.lua', opts = {} },
    { 'rust-lang/rust.vim', lazy = true },
    { 'windwp/nvim-ts-autotag', opts = {} },
    {
      'olrtg/nvim-emmet',
      config = function()
        vim.keymap.set({ 'n', 'v' }, ',,', require('nvim-emmet').wrap_with_abbreviation)
      end,
    },
    'NMAC427/guess-indent.nvim',
  },
}
