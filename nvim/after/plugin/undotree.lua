vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- Enable persistent undo
vim.o.undofile = true
local undodir = vim.fn.stdpath("config") .. "/.undodir"
vim.o.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

