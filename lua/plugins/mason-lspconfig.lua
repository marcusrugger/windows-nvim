return {
  "williamboman/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  lazy = false,
  dependencies = { "mason" },
  config = function()
    require("mason-lspconfig").setup({})
    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup({})
      end,

      ["lua_ls"] = function (server_name)
        require("lspconfig")[server_name].setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        }
      end,
    }
  end,
}

