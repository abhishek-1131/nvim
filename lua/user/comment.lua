local M = {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {

    {
      "JoosepAlviste/nvim-ts-context-commentstring", -- for react
      event = "VeryLazy", 
    },
  },
}

function M.config()
  local wk = require "which-key"
  wk.add({
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment" },
  })

  wk.add({
    { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment", mode = "v" },
  })

  vim.g.skip_ts_context_commentstring_module = true
  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }

  require("Comment").setup {
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      above = "gcO",
      ---Add comment on the line below
      below = "gco",
      ---Add comment at the end of line
      eol = "gca",
    },
    mappings = {
      extra = true,
    },
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M
