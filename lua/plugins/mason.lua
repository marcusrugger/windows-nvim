-- Package manager for LSP servers, DAP servers, linters, and formatters
return {
  "williamboman/mason.nvim",
  name = "mason",
  lazy = false,
  config = function()
    require("mason").setup({})
  end,
}

