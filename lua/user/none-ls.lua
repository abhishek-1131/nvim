local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"
  local mason_null_ls = require "mason-null-ls"
  local builtins = null_ls.builtins

  -- Register the flake8 source
  local h = require("null-ls.helpers")
  local methods = require("null-ls.methods")
  local DIAGNOSTICS = methods.internal.DIAGNOSTICS

  local flake8 = {
    name = "flake8",
    method = DIAGNOSTICS,
    filetypes = { "python" },
    generator = null_ls.generator({
      command = "/opt/homebrew/bin/flake8",
      args = { "--max-line-length", "88", "--format", "default", "$FILENAME" },
      to_stdin = true,
      from_stderr = true,
      format = "line",
      on_output = h.diagnostics.from_pattern(
        [[^.*:(\d+):(\d+): (.+)$]],
        { "row", "col", "message" }
      ),
    }),
  }

  mason_null_ls.setup({
    ensure_installed = {
      "stylua",
      "prettier",
      "black",
    },
    automatic_installation = true,
    handlers = {},
  })

  null_ls.setup {
    debug = true,
    sources = {
      builtins.formatting.stylua,
      builtins.formatting.prettier,
      builtins.formatting.black,
      flake8,  -- Use our custom flake8 source
      builtins.completion.spell,
    },
  }
end

return M
