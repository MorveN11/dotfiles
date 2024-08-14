-- Nvim Auto Commands
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.opt.conceallevel = 0
    end,
})

-- Disable Spell Check for all file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = false
    end,
})
