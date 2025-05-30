return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      fold = { enable = true }
    })
  end,
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  },
  cmd = {
    "TSInstall",
    "TSUpdate"
  }
}
