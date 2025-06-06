return {
  "echasnovski/mini.nvim",
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  version = false,
  config = function()
    require('ts_context_commentstring').setup({
      enable_autocmd = false
    })
    -- Editing
    require("mini.ai").setup()
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        end
      }
    })
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()
    -- Workflow
    require("mini.bracketed").setup({
      diagnostic = {
        options = {
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN
          }
        }
      }
    })
    require("mini.bufremove").setup()
    require("mini.jump").setup()
    require("mini.jump2d").setup({
      view = {
        dim = true,
      }
    })
    -- Appearance
    require("mini.cursorword").setup()
    require("mini.hipatterns").setup({
      highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    })
    require("mini.indentscope").setup({
      draw = {
        delay = 50,
        animation = require('mini.indentscope').gen_animation.none()
      },
      symbol = '│'
    })
    require("mini.trailspace").setup()
  end,
  lazy = false
}
