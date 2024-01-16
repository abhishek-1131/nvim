local M = {
  -- "LunarVim/primer.nvim",
  "LunarVim/darkplus.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  -- vim.cmd.colorscheme "primer_dark"
  vim.cmd.colorscheme "darkplus"
  -- vim.cmd.colorscheme "default"
end

return M
