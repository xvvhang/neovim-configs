return {
  "f-person/git-blame.nvim",
  opts = {
    message_template = "<author> <sha> <date>",
    date_format = "%x"
  },
  config = function(_, opts)
    vim.g.gitblame_display_virtual_text = 0
    require("gitblame").setup(opts)
  end
}
