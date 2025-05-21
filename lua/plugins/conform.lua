return {
  "stevearc/conform.nvim",
  --event = { "BufWritePre" },
  --config = function()
  --local conform = require("conform")
  --conform.setup({
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      javascript = { "prettier" },
      typescript = { "prettier" },
      python = { "black" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      cpp = { "clang-format" },
      -- Use a sub-list to run only the first available formatter
      sh = { "shellharden", "shfmt" },
    },

    formatters = {
      prettier = {
        prepend_args = { "--prose-wrap", "always" },
      },
    },

    --format_on_save = {
    --  lsp_fallback = true,
    --  timeout_ms = 500,
    --},
    --})
  },
  --end,
}
