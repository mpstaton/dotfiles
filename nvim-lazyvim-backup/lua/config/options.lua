-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable termguicolors to ensure terminal colors are used
vim.opt.termguicolors = false

-- Basic cursor settings
vim.opt.cursorline = true

-- Swap file settings to avoid prompts
vim.opt.swapfile = false      -- Disable swap files completely
vim.opt.backup = false        -- Don't create backup files
vim.opt.writebackup = false   -- Don't create backup files during write

-- For vim-visual-multi visibility
vim.g.VM_theme = 'ocean'                -- More visible theme for multi-cursor
vim.g.VM_highlight_matches = 'hi_visual' -- Higher contrast for matches
vim.g.VM_persistent_cursors = 1         -- Keep cursors visible in all modes
