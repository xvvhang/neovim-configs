return {
  "folke/snacks.nvim",
  opts = {
    input = {
      icon = " ",
    },
    notifier = {
      enabled = true,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
    },
    lazygit = {
      win = {
        style = "float",
        backdrop = false,
        border = "rounded"
      }
    },
    picker = {
      prompt = " ",
      layout = {
        preset = "select"
      },
      icons = {
        files = {
          enabled = false,
        },
        keymaps = {
          nowait = " "
        },
        tree = {
          vertical = "│ ",
          middle   = "├╴",
          last     = "└╴",
        },
        undo = {
          saved   = " ",
        },
        ui = {
          live        = " ",
          hidden      = "h",
          ignored     = "i",
          follow      = "f",
          selected    = " ",
          unselected  = " ",
        },
        git = {
          enabled = false
        },
        diagnostics = {
          Error = " ",
          Warn  = " ",
          Hint  = " ",
          Info  = " ",
        },
        lsp = {
          unavailable = " ",
          enabled = " ",
          disabled = " ",
          attached = "󰖩 "
        },
        kinds = {
          Array         = " ",
          Boolean       = " ",
          Class         = " ",
          Collapsed     = " ",
          Color         = " ",
          Constant      = " ",
          Constructor   = " ",
          Control       = " ",
          Copilot       = " ",
          Enum          = " ",
          EnumMember    = " ",
          Event         = " ",
          Field         = " ",
          File          = " ",
          Folder        = " ",
          Function      = " ",
          Interface     = " ",
          Key           = " ",
          Keyword       = " ",
          Method        = " ",
          Module        = " ",
          Namespace     = " ",
          Null          = " ",
          Number        = " ",
          Object        = " ",
          Operator      = " ",
          Package       = " ",
          Property      = " ",
          Snippet       = " ",
          Reference     = " ",
          String        = " ",
          Struct        = " ",
          Text          = " ",
          TypeParameter = " ",
          Unit          = " ",
          Unknown       = " ",
          Value         = " ",
          Variable      = " ",
        },
      }
    }
  },
  lazy = false,
  keys = {
    { "<leader>g", function() Snacks.lazygit() end},
    { "<leader>/", function() Snacks.picker() end },
    { "<leader>.", function() Snacks.picker.resume() end },
    { "<leader>f", function() Snacks.picker.files() end },
    { "<leader>s", function() Snacks.picker.grep() end },
    { "<leader>h", function() Snacks.picker.git_status() end },
    { "<leader>e", function() Snacks.picker.diagnostics() end },
    { "<leader>o", function() Snacks.picker.lsp_symbols() end },
    { "<leader>r", function() Snacks.picker.lsp_references() end },
  }
}
