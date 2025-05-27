local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

local plugins = {
  require("theme"),
  require("plugins.lualine"),
  require("plugins.bufferline"),
  require("plugins.barbecue"),
  require("plugins.yazi"),
  require("plugins.mini"),
  require("plugins.snacks"),
  require("plugins.git-blame"),
  require("plugins.smart-splits"),
  require("plugins.treesitter"),
  require("plugins.lspconfig"),
  require("plugins.blink-cmp"),
  require("plugins.copilot"),
  require("plugins.copilot-chat")
}

local options = {
  ui = {
    border = "rounded",
    title = " Lazy ",
    pills = false,
    icons  ={
      cmd = " ",
      config = " ",
      debug = " ",
      event = " ",
      favorite = " ",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = " ",
      loaded = " ",
      not_loaded = " ",
      plugin = " ",
      runtime = " ",
      require = " ",
      source = " ",
      start = " ",
      task = " ",
      list = {
        " ",
        " ",
        " ",
        " ",
      }
    }
  }
}

lazy.setup(plugins, options)
