local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      cache_picker = true,
      path_display = { "tail" },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = true,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = true,
      },
      buffers = {
        theme = "dropdown",
        previewer = true,
      },
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  lazy = false,
  config = config,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  },
  keys = {
    vim.keymap.set('n', "<leader>fk", ":Telescope keymaps<cr>", { desc = "Show Keymaps" }),
    vim.keymap.set('n', "<leader>fh", ":Telescope help_tags<cr>", { desc = "Show Help Tags" }),
    vim.keymap.set('n', "<leader>ff", ":Telescope find_files<cr>", { desc = "Find Files" }),
    vim.keymap.set('n', "<leader>fg", ":Telescope live_grep<cr>", { desc = "Live Grep" }),
    vim.keymap.set('n', "<leader>fc", ":Telescope grep_string<cr>", { desc = "Live Grep" }),
    vim.keymap.set('n', "<leader>fb", ":Telescope buffers<cr>", { desc = "Find Buffers" }),
    vim.keymap.set('n', "<leader>fr", ":Telescope resume<cr>", { desc = "Resume last picker" }),
    vim.keymap.set('n', "<leader>fn", ":Telescope git_files<cr>", { desc = "Git Files" }),
  },
}
