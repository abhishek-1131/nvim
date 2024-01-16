local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufRead",
  commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
}

function M.config()
  local icons = require "user.icons"

  require("indent_blankline").setup {
    buftype_exclude = { "terminal", "nofile", "quickfix", "dashboard"},
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "lazy",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "text",
    },
    -- char = icons.ui.LineLeft,
    char = icons.ui.LineMiddle,
    -- context_char = icons.ui.LineLeft,
    filetype_exclude = { "help", "terminal", "dashboard", "lspinfo" },
    buftype_exclude = { "terminal", "dashboard", "nofile", "quickfix" },
    context_char = icons.ui.LineMiddle,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    use_treesitter = true,
  }

  -- indent = { char = icons.ui.LineMiddle },
  -- whitespace = {
  --   remove_blankline_trail = true,
  -- },
  --
  -- exclude = {
  --   filetypes = {
  --     "help",
  --     "startify",
  --     "dashboard",
  --     "lazy",
  --     "neogitstatus",
  --     "NvimTree",
  --     "Trouble",
  --     "text",
  --   },
  --   buftypes = { "terminal", "nofile" },
  -- },
  -- scope = { enabled = false },
end

return M
