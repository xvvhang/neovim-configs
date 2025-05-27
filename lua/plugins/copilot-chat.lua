return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" }
  },
  build = "make tiktoken",
  opts = {
    model = "claude-3.5-sonnet",
    window = {
      layout = "vertical",
      width = 0.4,
      height = 0.3,
    },
    show_help = false,
    -- HACK set chat_autocomplete to false to use blink cmp
    chat_autocomplete = true,
    question_header = " User ",
    answer_header = " Copilot ",
    error_header = " Error ",
    separator = "---",
  },
  keys = {
    { "<leader>i", ":CopilotChat " },
    { "<leader>l", ":CopilotChatToggle<CR>" },
  }
}
