return {
  "hrsh7th/cmp-nvim-lsp",
  name = "nvim_lsp",
  config = function()
    local cmplsp = require("nvim_lsp").default_capabilities()

    require("lspconfig").omnisharp.setup({
      capabilities = cmplsp,
    })
  end
}

