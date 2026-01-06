-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Window split horizontal" })
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Window split vertical" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Windows equal size" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Window close" })

-- window resizing (easier keymaps)
keymap.set("n", "<leader>w+", ":resize +5<CR>", { desc = "Increase window height" })
keymap.set("n", "<leader>w-", ":resize -5<CR>", { desc = "Decrease window height" })
keymap.set("n", "<leader>w>", ":vertical resize +5<CR>", { desc = "Increase window width" })
keymap.set("n", "<leader>w<", ":vertical resize -5<CR>", { desc = "Decrease window width" })

-- Alternative: Alt + arrow keys for continuous resizing
keymap.set("n", "<M-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<M-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
-- Use Shift+Alt for horizontal resizing (Alt+Left/Right often conflict with word nav)
keymap.set("n", "<M-S-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
keymap.set("n", "<M-S-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

keymap.set("n", "<leader>h", "<Cmd>wincmd h<CR>", { desc = "Move cursor to left window" })
keymap.set("n", "<leader>j", "<Cmd>wincmd j<CR>", { desc = "Move cursor to bottom window" })
keymap.set("n", "<leader>k", "<Cmd>wincmd k<CR>", { desc = "Move cursor to top window" })
keymap.set("n", "<leader>l", "<Cmd>wincmd l<CR>", { desc = "Move cursor to right window" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Tab open" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Tab close" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Tab next" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Tab previous" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Tab current file" })

-- copy to clipboard
keymap.set("v", "<C-c>", [["+y]])
