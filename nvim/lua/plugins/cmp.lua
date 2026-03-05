return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp", "windwp/nvim-autopairs" },
  config = function()
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
    local cmp = require("cmp")
    vim.opt.pumheight = 5
    cmp.setup({
      sources = { { name = "nvim_lsp" } },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"]   = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"]    = cmp.mapping.confirm({ select = true }),
      }),
    })
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
  end,
}
