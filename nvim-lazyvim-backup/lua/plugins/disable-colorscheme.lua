return {
  -- Disable LazyVim's default colorschemes
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
  
  -- Use default colorscheme (terminal colors)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- Force terminal colors
        vim.opt.termguicolors = false
        -- Use default colorscheme (terminal colors)
        vim.cmd("colorscheme default")
        -- Don't set background explicitly
      end,
    },
  },
}
