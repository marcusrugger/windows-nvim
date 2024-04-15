return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
  require("nvim-tree").setup({
    filters = {
      dotfiles = false,
    },
    view = {
      adaptive_size = true,
    },
  })
  end,
}
