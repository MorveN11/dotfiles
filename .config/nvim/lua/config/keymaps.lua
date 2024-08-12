-- Nvim Keymaps
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Go to the end beginning of the line
keymap.set("n", "<C-l>", "$")
keymap.set("n", "<C-h>", "^")

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Split window
keymap.set("n", "sd", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Move Line Down Up
keymap.set("n", "<C-S-Down>", ":m .+1<CR>==", opts)
keymap.set("n", "<C-S-Up>", ":m .-2<CR>==", opts)

-- Move Line Down Up Visual and Keep Selection
keymap.set("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", opts)

-- New tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "tw", ":tabclose<CR>", opts)

-- Oil: File Manager Setup
keymap.set("n", "-", ":Oil<CR>", opts)

-- Compitest: Competitive Programming Setup
keymap.set("n", "<leader>pe", ":CompetiTest edit_testcase<CR>", opts)
keymap.set("n", "<leader>pd", ":CompetiTest delete_testcase<CR>", opts)
keymap.set("n", "<leader>pr", ":CompetiTest run<CR>", opts)
keymap.set("n", "<leader>pa", ":CompetiTest add_testcase<CR>", opts)
keymap.set("n", "<leader>pp", ":CompetiTest receive problem<CR>", opts)
keymap.set("n", "<leader>ps", ":CompetiTest show_ui<CR>", opts)

-- Obsidian: Notes Management Setup
keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Create New Note" })
keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", { desc = "Search Obsidian Quick Switch" })

-- Diagnostics Movement
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-k>", function()
    vim.diagnostic.goto_prev()
end, opts)
