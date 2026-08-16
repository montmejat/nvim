-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LazyVim maps <C-h/j/k/l> for window navigation in NORMAL mode only, so
-- leaving a :terminal means <C-\><C-n> first. Mirror them into terminal mode
-- so moving between the shell, the editor and <leader>e is a single keystroke.
--
-- Note: this takes <C-h> (backspace) and <C-l> (clear) away from the shell.
-- Swap the "<C-" prefix below for "<A-" if you'd rather keep those.
for _, key in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set("t", "<C-" .. key .. ">", "<C-\\><C-n><C-w>" .. key, {
    desc = "Go to " .. key .. " window",
  })
end

-- In terminal mode <C-w> is not a window command -- it goes to the shell,
-- where readline reads it as "delete previous word". Turn it into the window
-- prefix instead, so <C-w>+ / <C-w>- / <C-w>_ resize the terminal split
-- straight from the shell without leaving terminal mode first.
--
-- Trade-off: the shell no longer receives <C-w>. Use <C-\><C-n> then <C-w>
-- if you'd rather keep delete-word.
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "Window prefix" })
