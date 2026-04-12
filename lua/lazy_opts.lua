return {
  rocks = {
    enabled = false,
  },
  spec = {
    { import = 'plugins' },
    { 'ethanholz/nvim-lastplace', event = 'BufReadPost', opts = {} },
    {
      'folke/ts-comments.nvim',
      event = 'VeryLazy',
      opts = {},
    },
    {
      'mrcjkb/rustaceanvim',
      ft = { 'rust' },
    },
    { 'j-hui/fidget.nvim', event = 'LspAttach', opts = {} },
    { 'nvchad/nvim-colorizer.lua', event = 'BufReadPost', opts = {} },
    { 'windwp/nvim-ts-autotag', event = 'BufReadPost', opts = {} },
    {
      'olrtg/nvim-emmet',
      ft = { 'html', 'css', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'razor' },
      config = function()
        vim.keymap.set({ 'n', 'v' }, ',,', require('nvim-emmet').wrap_with_abbreviation)
      end,
    },
    { 'NMAC427/guess-indent.nvim', event = 'BufReadPost', opts = {} },
  },
}
