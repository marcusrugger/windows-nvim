local config = function()
  require("lualine").setup({
    options = {
      -- theme = "kanagawa",
      -- theme = "catppuccin",
      globalstatus = true,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "buffers" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {},
  })
end

return {
  "nvim-lualine/lualine.nvim",
  -- dependencies = { ThemePlugin },
  -- dependencies = { "catppuccin/nvim" },
  lazy = false,
  config = config,
}

