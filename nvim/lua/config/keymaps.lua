-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map(
  "n",
  "<C-l>",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update", silent = true }
)

map("i", "<C-l>", "<Right>", { desc = "Right" })
map("i", "<C-h>", "<Left>", { desc = "Left" })
map("i", "<C-a>", "<ESC>I", { desc = "Insert" })
map("i", "<C-e>", "<ESC>A", { desc = "Append" })
map("i", "<C-d>", "<DEL>", { desc = "Del" })
