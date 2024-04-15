-- nvim-tree says to do this:
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- **********************************************
-- Pull in lazy.vim if not already installed
-- **********************************************

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Map leader and local leader
vim.g.mapleader = " "                       -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\"                 -- Same for `maplocalleader`


-- **********************************************
-- Configure options
-- **********************************************

-- [[ Tab / Indentation ]]
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- [[ Clipboard ]]
-- vim.opt.clipboard = "unnamedplus"        -- str:  Use the system clipboard

-- [[ Line Numbers ]]
vim.opt.number = true                       -- bool: Show line numbers
vim.opt.relativenumber = true               -- bool: Show line numbers relative to the line with the cursor

-- [[ Behavior ]]
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.scrolloff = 20
vim.opt.virtualedit = "block"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Theme ]]
vim.opt.syntax = "ON"                       -- str:  Allow syntax highlighting
vim.opt.termguicolors = true                -- bool: If term supports ui color then enable


-- **********************************************
-- Configure plugins
-- **********************************************

local theme_name = "kanagawa-dragon"

local lazy_plugins = {
  { import = "plugins" },
  { import = "themes" },
}

local lazy_options = {
  defaults = {
    lazy = true,
  },
  rtp = {
    disabled_plugins = {
    },
  },
  change_detection = {
    notify = false,
  },
  install = {
    missing = true,
    colorscheme = { theme_name },
  },
}

require("lazy").setup(lazy_plugins, lazy_options)

-- Setup for Toggleterm
require("toggleterm").setup()
vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
vim.cmd [[let &shellcmdflag = '-s']]


-- **********************************************
-- Configure keymap
-- **********************************************

-- nvim-tree
vim.keymap.set('n', "<leader>n", ":NvimTreeToggle<cr>")
vim.keymap.set('n', "<C-j>", "<C-e>")
vim.keymap.set('n', "<C-k>", "<C-y>")
vim.keymap.set('n', "<C-h>", "<C-w>h")
vim.keymap.set('n', "<C-l>", "<C-w>l")

local nvimtree = require('nvim-tree.api')
vim.keymap.set('n', '<leader>b', function()
  nvimtree.tree.find_file({ open = true })
end, { desc = "Find file in NvimTree" })


-- **********************************************
-- Additional things
-- **********************************************

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "lua", "nix", "python", "sh", "yaml" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})

vim.cmd.colorscheme(theme_name)

