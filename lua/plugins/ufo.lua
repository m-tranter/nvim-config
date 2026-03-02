return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99

    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == 'vue' then
          return { 'lsp', 'indent' }
        end
        return { 'treesitter', 'indent' }
      end,
    }
  end,
}
