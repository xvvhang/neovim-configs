return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signcolumn = false,
    numhl = true,
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 500
    },
    current_line_blame_formatter = '<author> <abbrev_sha> <author_time:%x>'
  },
  keys = {
    { "]h", function() require("gitsigns").nav_hunk('next') end, mode = {"n", "v"} },
    { "[h", function() require("gitsigns").nav_hunk('prev') end, mode = {"n", "v"} },
    { "gh", function() require("gitsigns").preview_hunk() end },
    { "gu", function() require("gitsigns").reset_hunk() end },
    { "gu", function() require("gitsigns").reset_hunk() end, mode = "v" },
    { "gD", function() require("gitsigns").diffthis() end },
    { "ih", function() require("gitsigns").select_hunk() end, mode = {"o", "x"} }
  },
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  }
}
