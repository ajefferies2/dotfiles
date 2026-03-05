vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"

vim.o.updatetime = 300

vim.o.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undodir"
vim.o.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.api.nvim_create_autocmd("CursorHold", {
  callback = vim.diagnostic.open_float,
})
