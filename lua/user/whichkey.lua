local M = {
  "folke/which-key.nvim",
}

function M.config()
  -- Set a shorter timeout for which-key to appear
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      no_overlap = true,  -- prevent overlap with cursor
      width = { min = 20, max = 50 }, 
      height = { min = 4, max = 15 }, 
      padding = { 1, 2 },  -- [top/bottom, right/left] padding
      title = true,  -- show title
      title_pos = "center",  -- center the title
      zindex = 1000,  -- keep it on top
      bo = {},  -- buffer options
      wo = {
        winblend = 0,  -- fully opaque by default
        conceallevel = 0,  -- show everything
        wrap = false,  -- no text wrapping
      },
    },
    -- filter = true,  -- Enable this to hide mappings for which you didn't specify a label
    -- triggers_nowait = {
    --   -- marks
    --   "`",
    --   "'",
    --   "g`",
    --   "g'",
    --   -- registers
    --   '"',
    --   "<c-r>",
    --   -- spelling
    --   "z=",
    -- },
    triggers = {"<leader>"},  -- or specify a list of triggers, including <leader>
    filter = function(client) return true end,
    show_help = true,
    show_keys = true,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  -- Add mappings using the new v3 spec format
  which_key.add({
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    { "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
    { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
    { "<leader>b", group = "Buffers" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>p", group = "Plugins" },
    { "<leader>t", group = "Test" },
    { "<leader>T", group = "Treesitter" },
    {
      "<leader>a",
      group = "Tab",
      {
        { "<leader>an", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
        { "<leader>aN", "<cmd>tabnew %<cr>", desc = "New Tab" },
        { "<leader>ao", "<cmd>tabonly<cr>", desc = "Only" },
        { "<leader>ah", "<cmd>-tabmove<cr>", desc = "Move Left" },
        { "<leader>al", "<cmd>+tabmove<cr>", desc = "Move Right" },
      }
    },
  })
end

return M
