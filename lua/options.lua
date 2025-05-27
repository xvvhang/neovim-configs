vim.opt.cmdheight = 0
vim.opt.completeopt = "menu"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.pumheight = 8
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.winborder = "rounded"
vim.opt.wrap = false

vim.diagnostic.config({
  underline = {
    severity = {
      min = vim.diagnostic.severity.WARN
    }
  },
  signs = {
    severity = {
      min = vim.diagnostic.severity.WARN
    },
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " "
    }
  },
  float = {
    severity = {
      min = vim.diagnostic.severity.WARN
    },
    severity_sort = true,
    source = true,
    border = "rounded",
  },
  severity_sort = true
})

