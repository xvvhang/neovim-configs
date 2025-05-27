return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      number = "none",
      indicator = { style = "none" },
      modified_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = { "", "" }
    },
    highlights = {
      fill = {
        bg = {
          attribute = "bg",
          highlight = "TabLine"
        }
      },
      buffer = {
        bg = {
          attribute = "bg",
          highlight = "TabLine"
        }
      },
      buffer_selected = {
        italic = false
      },
      modified = {
        fg = {
          attribute = "fg",
          highlight = "BufferLineNumber"
        }
      },
      modified_visible = {
        fg = {
          attribute = "fg",
          highlight = "BufferLineNumber"
        }
      },
      modified_selected = {
        fg = {
          attribute = "fg",
          highlight = "BufferLineNumber"
        }
      }
    }
  },
  lazy = false,
  keys = {
    { "<leader>1", ":lua require('bufferline').go_to(1, true)<CR>" },
    { "<leader>2", ":lua require('bufferline').go_to(2, true)<CR>" },
    { "<leader>3", ":lua require('bufferline').go_to(3, true)<CR>" },
    { "<leader>4", ":lua require('bufferline').go_to(4, true)<CR>" },
    { "<leader>5", ":lua require('bufferline').go_to(5, true)<CR>" },
    { "<leader>6", ":lua require('bufferline').go_to(6, true)<CR>" },
    { "<leader>7", ":lua require('bufferline').go_to(7, true)<CR>" },
    { "<leader>8", ":lua require('bufferline').go_to(8, true)<CR>" },
    { "<leader>9", ":lua require('bufferline').go_to(9, true)<CR>" },
    { "<leader>b", ":lua require('bufferline').pick() <CR>"}
  }
}
