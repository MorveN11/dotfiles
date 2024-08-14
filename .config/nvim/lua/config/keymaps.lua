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

-- Move Line Down Up
keymap.set("n", "<C-S-Down>", ":m .+1<CR>==", opts)
keymap.set("n", "<C-S-Up>", ":m .-2<CR>==", opts)

-- Move Line Down Up Visual and Keep Selection
keymap.set("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", opts)

-- Split window
keymap.set("n", "sd", "<CMD>split<CR>", { desc = "Split Window Down" })
keymap.set("n", "sv", "<CMD>vsplit<CR>", { desc = "Split Window Right" })

-- New tab
keymap.set("n", "tn", "<CMD>tabedit<CR>", { desc = "New Tab" })
keymap.set("n", "tq", "<CMD>tabclose<CR>", { desc = "Close Tab" })

-- Oil: File Manager Setup
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open File Manager" })

-- Compitest: Competitive Programming Setup
keymap.set("n", "<leader>pe", "<CMD>CompetiTest edit_testcase<CR>", { desc = "Edit Testcase" })
keymap.set("n", "<leader>pd", "<CMD>CompetiTest delete_testcase<CR>", { desc = "Delete Testcase" })
keymap.set("n", "<leader>pr", "<CMD>CompetiTest run<CR>", { desc = "Run TestCases" })
keymap.set("n", "<leader>pa", "<CMD>CompetiTest add_testcase<CR>", { desc = "Add Testcase" })
keymap.set("n", "<leader>pp", "<CMD>CompetiTest receive problem<CR>", { desc = "Receive Problem" })
keymap.set("n", "<leader>po", "<CMD>CompetiTest show_ui<CR>", { desc = "Show UI" })

-- Obsidian: Notes Management Setup
keymap.set("n", "<leader>oo", "<CMD>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
keymap.set("n", "<leader>on", "<CMD>ObsidianNew<CR>", { desc = "Create New Note" })
keymap.set("n", "<leader>os", "<CMD>ObsidianQuickSwitch<CR>", { desc = "Search Obsidian Quick Switch" })

-- Diagnostics Movement
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-k>", function()
    vim.diagnostic.goto_prev()
end, opts)
