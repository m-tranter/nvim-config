return {
  'olimorris/codecompanion.nvim',
  cmd = 'CodeCompanion',
  keys = {
    { '<Leader>ci', '<cmd>CodeCompanion<cr>', mode = { 'n', 'v' }, desc = 'Inline code companion' },
    { '<C-a>', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'CC actions' },
    { '<Leader>i', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = 'CC chat' },
    { 'ga', '<cmd>CodeCompanionChat Add<cr>', mode = 'v', desc = 'Send selection to CC' },
  },
  dependencies = {
    'ravitemer/mcphub.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      prompt_library = {
        markdown = {
          dirs = {
            '~/.config/codecompanion',
            vim.fn.getcwd(),
          },
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_tools = true,
            show_server_tools_in_chat = true,
            add_mcp_prefix_to_tool_names = false,
            show_result_in_chat = false,
            make_vars = true,
            make_slash_commands = true,
          },
        },
      },
      adapters = {
        http = {
          anthropic = function()
            return require('codecompanion.adapters').extend('anthropic', {
              name = 'sonnet4-6',
              env = { api_key = 'ANTHROPIC_API_KEY' },
              schema = {
                model = { default = 'claude-sonnet-4-6' },
                max_tokens = { default = 20480 },
                temperature = { default = 0.4 },
              },
            })
          end,

          openrouter = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              name = 'openrouter',
              env = {
                url = 'https://openrouter.ai/api/v1',
                api_key = 'OPENROUTER_API_KEY',
                chat_url = '/chat/completions',
              },
              headers = {
                ['HTTP-Referer'] = 'https://github.com/neovim/neovim',
                ['X-Title'] = 'Neovim CodeCompanion',
              },
              schema = {
                model = {
                  default = 'deepseek/deepseek-v3.2',
                  choices = {
                    'minimax/minimax-m2.7',
                    'deepseek/deepseek-v3.2',
                  },
                },
              },
            })
          end,
        },
      },

      handlers = {
        parse_message_meta = function(self, data)
          local extra = data.extra
          if extra and extra.reasoning then
            data.output.reasoning = { content = extra.reasoning }
            if data.output.content == '' then
              data.output.content = nil
            end
          end
          return data
        end,
      },

      strategies = {
        chat = { adapter = 'openrouter', tools = {}, variables = {} },
        inline = { adapter = 'openrouter', tools = {}, variables = {} },
        agent = { adapter = 'openrouter', tools = {}, variables = {} },
      },

      display = {
        chat = { render_headers = false },
      },
    }
  end,
}
