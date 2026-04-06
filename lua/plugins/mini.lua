return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    -- track active codecompanion model
    local cc_model = ''
    vim.api.nvim_create_autocmd('User', {
      pattern = { 'CodeCompanionChatOpened', 'CodeCompanionRequestStarted' },
      callback = function(args)
        vim.schedule(function()
          local ok, chat = pcall(require('codecompanion').buf_get_chat, args.buf)
          if not ok or not chat then
            return
          end
          local adapter = chat.adapter
          if not adapter then
            return
          end
          cc_model = adapter.model.name or adapter.name or ''
        end)
      end,
    })
    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
          local git = statusline.section_git { trunc_width = 75 }
          local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
          local filename = statusline.section_filename { trunc_width = 140 }
          local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
          local location = '%2l:%-2v'
          local model = cc_model ~= '' and ('󰧑 ' .. cc_model) or ''
          return statusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
            '%<',
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineDevinfo', strings = { model } },
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl, strings = { location } },
          }
        end,
      },
    }
  end,
}
