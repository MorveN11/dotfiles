local discipline = require("util.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Go to the end beginning of the line
keymap.set("n", "<C-l>", "$", opts)
keymap.set("n", "<C-h>", "^", opts)

-- Tabs
keymap.set("n", "<tab>", "<Cmd>lua require('vscode').call('workbench.action.nextEditor')<Cr><Esc>", opts)
keymap.set("n", "<s-tab>", "<Cmd>lua require('vscode').call('workbench.action.previousEditor')<Cr><Esc>", opts)

-- Split window
keymap.set("n", "ss", "<Cmd>lua require('vscode').call('workbench.action.splitEditorDown')<Cr><Esc>", opts)
keymap.set("n", "sv", "<Cmd>lua require('vscode').call('workbench.action.splitEditorRight')<Cr><Esc>", opts)

-- Move window
keymap.set("n", "sh", "<Cmd>lua require('vscode').call('workbench.action.focusPreviousGroup')<Cr><Esc>", opts)
keymap.set("n", "sl", "<Cmd>lua require('vscode').call('workbench.action.focusNextGroup')<Cr><Esc>", opts)

-- Code Actions
keymap.set("n", "<leader>ca", "<Cmd>lua require('vscode').call('editor.action.quickFix')<Cr><Esc>", opts)
