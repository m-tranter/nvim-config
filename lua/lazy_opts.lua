return {
  spec = {
    { import = 'plugins' },
    { 'ethanholz/nvim-lastplace', opts = {} },
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        enable_autocmd = true,
      },
    },
    {
      'mrcjkb/rustaceanvim',
      lazy = true,
    },
    { 'nvchad/nvim-colorizer.lua', opts = {} },
    { 'rust-lang/rust.vim', lazy = true },
    { 'windwp/nvim-ts-autotag', opts = {} },
    'NMAC427/guess-indent.nvim',
    'mattn/emmet-vim',
  },
}
