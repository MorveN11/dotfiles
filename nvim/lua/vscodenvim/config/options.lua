vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.shell = "zsh"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_ruby_provider = 0
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
