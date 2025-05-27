return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    symbols = {
      modified = "",
      ellipsis = "",
    }
  },
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  }
}
