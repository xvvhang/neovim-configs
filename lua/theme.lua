return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup()
    vim.cmd([[colorscheme kanagawa-wave]])
  end,
  lazy = false,
  priority = 1000
}

