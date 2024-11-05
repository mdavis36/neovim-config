-- Keymap are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<Esc>", { desc = "Escape Insertion Mode" })

map("n", "<C-B>", "<C-O>", { desc = "Jump back to last move position." })

-- Resize window using <ctrl> arrow keys
map("n", "<C-I>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-U>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Y>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-O>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
