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

    -- LSP
    vim.lsp.enable('cssls')
    vim.lsp.config('emmet_language_server', {
      filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    })
    vim.lsp.enable('gopls')
    vim.lsp.enable('html')
    vim.lsp.enable('jsonls')
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
    vim.lsp.enable('tailwindcss')
    vim.lsp.enable('volar')
    vim.lsp.config('vtsls', {
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              }
            }
          }
        }
      }
    })
    vim.lsp.enable('yamlls')

    -- Lint
    vim.lsp.enable('eslint')
  end,
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  }
}
