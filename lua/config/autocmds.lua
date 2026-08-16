-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Neovim re-detects the terminal background (OSC 11) and updates
-- `background` when Ghostty flips between Adwaita and Adwaita Dark. The
-- colorscheme only reads that value when it loads, so re-apply it on change
-- to follow the light/dark switch without restarting.
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.g.colors_name == "adwaita" then
      vim.cmd.colorscheme("adwaita")
    end
  end,
})
