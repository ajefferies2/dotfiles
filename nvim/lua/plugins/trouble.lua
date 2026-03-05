return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",          desc = "Diagnostics" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
  },
  opts = {},
}
