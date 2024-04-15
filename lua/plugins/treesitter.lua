local config = function()
  require("nvim-treesitter.configs").setup({
    build = ":TSUpdate",
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    ensure_installed = {
      "bash",
      "c_sharp",
      "gitignore",
      "json",
      "lua",
      "markdown",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-s>",
        node_incremental = "<C-s>",
        scope_incremental = false,
        node_decremental = "<BS>",
      },
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  lazy = false,
  config = config,
}

