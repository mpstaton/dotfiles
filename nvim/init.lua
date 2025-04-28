-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = false  -- Disable for terminal color inheritance
vim.opt.clipboard = 'unnamedplus'

-- Leader key
vim.g.mapleader = ' '

-- Install vim-visual-multi directly
local install_path = vim.fn.stdpath('data')..'/site/pack/github/start/vim-visual-multi'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/mg979/vim-visual-multi', install_path})
end

-- Configure vim-visual-multi
vim.g.VM_theme = 'iceblue'
vim.g.VM_highlight_matches = 'underline'
vim.g.VM_maps = {
  ["Find Under"] = "<C-d>",
  ["Find Subword Under"] = "<C-d>",
  ["Select Cursor Down"] = "<S-Down>",
  ["Select Cursor Up"] = "<S-Up>",
  ["Add Cursor At Pos"] = "<C-q>"
}

-- Ensure cursors are visible during editing
vim.g.VM_persistent_cursors = 1
vim.g.VM_show_warnings = 0
vim.g.VM_silent_exit = 0

-- Enhanced visibility settings
vim.g.VM_Mono_hl = 'DiffText'
vim.g.VM_Extend_hl = 'DiffAdd'
vim.g.VM_Cursor_hl = 'Visual'
vim.g.VM_Insert_hl = 'DiffChange'

-- Ensure real-time updates at all cursor positions
vim.g.VM_live_editing = 1

-- Basic key mappings
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit' })
