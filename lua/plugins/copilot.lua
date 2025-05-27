return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      enabled = false
    },
    suggestion = {
      auto_trigger = true,
      debounce = 200,
      keymap = {
        accept = false,
        next = false,
        prev = false,
        dismiss = false
      }
    }
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    local tab_fallback = function()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end

    vim.keymap.set("i", '<Tab>', tab_fallback, { silent = true })
  end,
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  }
}
