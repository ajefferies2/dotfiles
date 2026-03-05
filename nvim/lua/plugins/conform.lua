return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      c          = { "clang_format" },
      cpp        = { "clang_format" },
      lua        = { "stylua" },
      python     = { "ruff_format" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
