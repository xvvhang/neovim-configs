return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      icons_enabled = false,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      theme = {
        normal = { c = { bg = vim.g.terminal_color_0 } },
        inactive = { c = { bg = vim.g.terminal_color_0 } }
        -- or make statusbar transparent
        -- normal = { c = { bg = "NONE" } },
        -- inactive = { c = { bg = "NONE" } }
      }
    },
    sections = {
      lualine_c = {},
      lualine_x = {},
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
    }
  },
  config = function(_, opts)
    local LF = {}
    local RT = {}

    local buf_icon = {}

    local get_buf_icon = function()
      local filepath = vim.api.nvim_buf_get_name(0)
      local filename = vim.fn.fnamemodify(filepath, ":t")
      local extension = vim.fn.fnamemodify(filename, ":e")
      buf_icon.icon, buf_icon.color = require("nvim-web-devicons").get_icon_color(
        filename, extension, { default = true }
      )
      return buf_icon.icon and buf_icon.icon .. ""
    end

    local get_hl_colors = function(hl)
      return vim.api.nvim_get_hl(0, { name = hl })
    end

    local get_is_git_repo = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end

    -- git logo
    table.insert(LF, {
      function() return " " end,
      cond = get_is_git_repo,
      color = function()
        local icon_colors = get_hl_colors("DevIconGitLogo")
        return { fg = icon_colors.fg and string.format("#%x", icon_colors.fg) or "" }
      end,
      padding = { left = 0, right = -1 }
    })

    -- git branch
    table.insert(LF, {
      "branch",
      cond = get_is_git_repo,
      color = function()
        local icon_colors = get_hl_colors("DevIconGitLogo")
        return { fg = icon_colors.fg and string.format("#%x", icon_colors.fg) or "" }
      end,
      padding = { left = 0, right = 1 }
    })

    -- buffer icon
    table.insert(LF, {
      function() return get_buf_icon() end,
      color = function()
        return { fg = buf_icon.color }
      end,
      padding = { left = get_is_git_repo and 1 or 0, right = 0 }
    })

    -- buffer name
    table.insert(LF, {
      "filename",
      color = function()
        return { fg = buf_icon.color }
      end,
      symbols = {
        modified = "[M]",
        readonly = "[R]",
        unnamed = "[U]",
        newfile = "[N]"
      }
    })

    -- diff
    table.insert(LF, {
      "diff",
      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    })

    -- diagnostics
    table.insert(LF, {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " }
    })

    -- TODO copilot status

    -- search count
    table.insert(RT, {
      "searchcount",
      color = function()
        local color = get_hl_colors("MatchParen")
        return { fg = color.fg and string.format("#%x", color.fg) or "" }
      end
    })

    -- selection count
    table.insert(RT, {
      "selectioncount",
      color = function()
        local color = get_hl_colors("MatchParen")
        return { fg = color.fg and string.format("#%x", color.fg) or "" }
      end
    })

    -- location
    table.insert(RT, {
      "location",
      color = function()
        local color = get_hl_colors("MatchParen")
        return { fg = color.fg and string.format("#%x", color.fg) or "" }
      end
    })

    table.insert(RT, {
      "progress",
      color = function()
        local color = get_hl_colors("MatchParen")
        return { fg = color.fg and string.format("#%x", color.fg) or "" }
      end
    })

    -- mode
    table.insert(RT, {
      "mode",
      color = { fg = vim.g.terminal_color_5 },
      padding = { left = 1, right = 0}
    })

    opts.sections.lualine_c = LF
    opts.sections.lualine_x = RT
    require("lualine").setup(opts)
    vim.cmd([[highlight link MsgArea lualine_c_normal]])
  end,
  lazy = false
}
