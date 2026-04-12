return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  config = function()
    require('tiny-inline-diagnostic').setup {
      preset = 'minimal', -- or 'classic', 'minimal'
      options = {
        multilines = true, -- wraps long messages
        show_source = true,
        transparent_bg = false,
        softwrap = 30,
        overflow = {
          mode = 'wrap', -- "wrap": split into lines, "none": no truncation, "oneline": keep single line
          padding = 4, -- Extra characters to trigger wrapping earlier
        },
        break_line = {
          enabled = true, -- Enable automatic line breaking
          after = 60, -- Number of characters before inserting a line break
        },
        add_messages = {
          messages = true, -- Show full diagnostic messages
          display_count = false, -- Show diagnostic count instead of messages when cursor not on line
          use_max_severity = false, -- When counting, only show the most severe diagnostic
          show_multiple_glyphs = false, -- Show multiple icons for multiple diagnostics of same severity
        },
        severity = {
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.ERROR,
        },
      },
    }
    vim.diagnostic.config { virtual_text = false } -- disable default
  end,
}
