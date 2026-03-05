return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end
      map("n", "]c", gs.next_hunk,        "Next hunk")
      map("n", "[c", gs.prev_hunk,        "Prev hunk")
      map("n", "<leader>hs", gs.stage_hunk,  "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk,  "Reset hunk")
      map("n", "<leader>hb", gs.blame_line,  "Blame line")
    end,
  },
}
