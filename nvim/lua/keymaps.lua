vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>xxd", ":%!xxd\n")
vim.keymap.set("n", "<leader>cx", "<cmd>silent !ctx<cr><cmd>redraw!<cr>", { desc = "Copy context (ctx)" })
--vim.keymap.set("n", "<leader>err", vim.diagnostic.open_float)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>cc", function()
  vim.cmd("botright split | resize 15 | terminal claude")
  vim.cmd("startinsert")
end, { desc = "Open Claude" })
