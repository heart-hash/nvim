require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Normal mode Mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Tmux Navigator
 map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
 map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
 map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })
 map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })


-- Keep the search term in the middle of the screen with n and N
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Moves the line below and appends it to the above with a space
map("n", "J", "mzJ`z", { desc = "Join lines with space and retain cursor position" })

-- Visual mode mappings
-- Paste over in visual mode without losing original yanked text
map("v", "<leader>p", [["_dP"]], { desc = "Paste over without losing original" })

-- Move selected line(s) down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })

-- Move selected line(s) up
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })
