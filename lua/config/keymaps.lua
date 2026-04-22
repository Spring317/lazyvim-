-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Resize windows with Leader (Space) + Shift + arrow keys
map({ "n", "t", "i", "v" }, "<leader><S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "t", "i", "v" }, "<leader><S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "t", "i", "v" }, "<leader><S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map({ "n", "t", "i", "v" }, "<leader><S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Navigate between windows (Terminal and Code) with Space (Leader) + Shift + H/L
map({ "n", "t", "i", "v" }, "<leader>H", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map({ "n", "t", "i", "v" }, "<leader>L", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- Alternate option mappings: Actual Super + Shift + H/L, in case that was strictly intended
map({ "n", "t", "i", "v" }, "<D-H>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map({ "n", "t", "i", "v" }, "<D-L>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
