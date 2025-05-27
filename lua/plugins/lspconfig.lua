return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
          width = 0.8,
          height = 0.85,
          icons = {
            package_installed = " ",
            package_pending = " ",
            package_uninstalled = " "
          }
        }
      },
      config = function(_, opts) require("mason").setup(opts) end,
      cmd = "Mason"
    },
    {
      "williamboman/mason-lspconfig",
      config = function() require("mason-lspconfig").setup() end
    }
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_registry = require("mason-registry")
    local vue_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'

    local window = require("lspconfig.ui.windows")
    window.default_options.border = "rounded"
    window.default_options.title = true

    vim.lsp.enable('bashls')
    vim.lsp.enable('css_variables')
    vim.lsp.enable('css_ls')
    vim.lsp.enable('dockerls')
    vim.lsp.enable('emmet_language_server')
    vim.lsp.enable('gopls')
    vim.lsp.enable('html')
    vim.lsp.enable('jsonls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable('tailwindcss')
    vim.lsp.enable('yamlls')


    vim.lsp.config('volar', {
      init_options = {
        vue = {
          hybridMode = false,
        }
      }
    })
    vim.lsp.config('ts_ls', {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_server_path,
            languages = { 'vue' },
          }
        }
      }
    })
  end,
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  }
}
