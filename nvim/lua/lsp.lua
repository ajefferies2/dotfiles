vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
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
  filetypes = { "c", "cpp" },
  root_markers = { "compile_commands.json", ".clangd", "CMakeLists.txt", "Makefile" },
}
vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt" },
}
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
}
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json" },
}
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go" },
  root_markers = { "go.mod" },
}
vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
}
vim.lsp.config.html = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json", ".git" },
}
vim.lsp.config.cssls = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss" },
  root_markers = { "package.json", ".git" },
}
vim.lsp.config.jsonls = {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { "package.json", ".git" },
}

vim.lsp.enable({
  "clangd", "pyright", "lua_ls", "ts_ls", "gopls",
  "rust_analyzer", "html", "cssls", "jsonls",
})
