return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    styles = {
      sidebars = "normal"
    }
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight-moon]])
  end,
  lazy = false,
  priority = 1000
}

