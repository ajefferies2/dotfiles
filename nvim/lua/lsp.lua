vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "netrw" or ft == "" then
      vim.lsp.buf_detach_client(args.buf, args.data.client_id)
      return
    end
    local o = { buffer = args.buf, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, o)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, o)
  end,
})

-- --query-driver lets clangd discover include paths from the cross-compiler.
-- STM32 projects also need a compile_commands.json in the project root
-- (use `cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON` or `bear -- make`).
vim.lsp.config.clangd = {
  cmd = { "clangd", "--query-driver=/usr/bin/arm-none-eabi-gcc,/usr/bin/arm-none-eabi-g++" },
}
vim.lsp.config.pyright      = { cmd = { "pyright-langserver", "--stdio" }, root_markers = { "pyproject.toml", "setup.py", "requirements.txt" } }
vim.lsp.config.lua_ls       = { cmd = { "lua-language-server" } }
vim.lsp.config.ts_ls        = { cmd = { "typescript-language-server", "--stdio" }, root_markers = { "package.json", "tsconfig.json" } }
vim.lsp.config.gopls        = { cmd = { "gopls" }, root_markers = { "go.mod" } }
vim.lsp.config.rust_analyzer = { cmd = { "rust-analyzer" } }
vim.lsp.config.html         = { cmd = { "vscode-html-language-server", "--stdio" } }
vim.lsp.config.cssls        = { cmd = { "vscode-css-language-server", "--stdio" } }
vim.lsp.config.jsonls       = { cmd = { "vscode-json-language-server", "--stdio" } }

vim.lsp.enable({
  "clangd", "pyright", "lua_ls", "ts_ls", "gopls",
  "html", "cssls", "jsonls",
})

-- only start rust-analyzer when a Cargo.toml exists in the tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(args)
    local root = vim.fs.root(args.buf, { "Cargo.toml" })
    if root then
      vim.lsp.start({ name = "rust_analyzer", cmd = { "rust-analyzer" }, root_dir = root })
    end
  end,
})
