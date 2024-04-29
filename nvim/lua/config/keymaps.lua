local discipline = require("util.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<C-S-j>", function()
	vim.diagnostic.goto_prev()
end, opts)

-- Move Line Down Up
keymap.set("n", "<C-S-Down>", ":m+1<CR>", opts)
keymap.set("n", "<C-S-Up>", ":m-2<CR>", opts)

-- Move Line Down Up Visual and Keep Selection
keymap.set("v", "<C-S-Down>", ":m'>+1<CR>gv", opts)
keymap.set("v", "<C-S-Up>", ":m'<-2<CR>gv", opts)

-- Go to the end beginning of the line
keymap.set("n", "<C-l>", "$", opts)
keymap.set("n", "<C-h>", "^", opts)

-- Oil Setup
local oil = require("oil")
oil.setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
