return {
  "saghen/blink.cmp", version = "*",
  dependencies = {
    "saghen/blink.compat",
    "rafamadriz/friendly-snippets",
    -- HACK uncomment this line to use completion in copilot chat
    -- "xvvhang/blink-cmp-copilot-chat"
  },
  opts = {
    -- HACK comment these lines to use completion in copilot chat
    enabled = function()
      return not vim.tbl_contains({ "copilot-chat" }, vim.bo.filetype)
    end,
    appearance = {
      kind_icons = {
        Text          = " ",
        Method        = " ",
        Function      = " ",
        Constructor   = " ",
        Field         = " ",
        Variable      = " ",
        Property      = " ",
        Class         = " ",
        Interface     = " ",
        Struct        = " ",
        Module        = " ",
        Unit          = " ",
        Value         = " ",
        Enum          = " ",
        EnumMember    = " ",
        Keyword       = " ",
        Constant      = " ",
        Snippet       = " ",
        Color         = " ",
        File          = " ",
        Reference     = " ",
        Folder        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
      }
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = true
        }
      },
      menu = {
        border = "none",
        draw = {
          gap = 2,
          treesitter = { "lsp" },
          columns = {
            { "kind" },
            { "label", "label_description", gap = 1 },
            { "source_name" }
          }
        }
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded"
        }
      }
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded"
      }
    },
    keymap = {
      preset = "enter"
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
      -- HACK uncomment these lines to use completion in copilot chat
      -- per_filetype = {
      --   ["copilot-chat"] = {
      --     "path",
      --     "copilotchat"
      --   }
      -- },
      -- providers = {
      --   copilotchat = {
      --     name = "CopilotChat",
      --     module = "blink-cmp-copilot-chat",
      --   }
      -- }
    }
  },
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  }
}
