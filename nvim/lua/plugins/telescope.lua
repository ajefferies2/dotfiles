return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>pf", "<cmd>Telescope find_files<cr>" },
    { "<C-p>",      "<cmd>Telescope git_files<cr>" },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>" },
    { "<leader>ps", function()
      require("telescope.builtin").grep_string({ search = vim.fn.input("grep > ") })
    end },
  },
}
