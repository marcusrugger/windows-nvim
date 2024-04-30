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
vim.opt.relativenumber = false              -- bool: Show line numbers relative to the line with the cursor

-- [[ Behavior ]]
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.scrolloff = 10
vim.opt.virtualedit = "block"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Theme ]]
vim.opt.syntax = "ON"                       -- str:  Allow syntax highlighting
vim.opt.termguicolors = true                -- bool: If term supports ui color then enable


-- **********************************************
-- Configure plugins
-- **********************************************

-- ThemePlugin = "catppuccin/nvim"
-- ThemeName = "catppuccin-latte"

ThemePlugin = "rebelot/kanagawa.nvim"
ThemeName = "kanagawa-wave"

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
    colorscheme = { ThemeName },
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
-- vim.keymap.set('n', "<C-j>", "<C-e>")
-- vim.keymap.set('n', "<C-k>", "<C-y>")
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

vim.cmd.colorscheme(ThemeName)


-- **********************************************
-- LSP Keymap
-- **********************************************

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<cr>", opts) -- vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', ":Telescope lsp_references<cr>", opts) -- vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

