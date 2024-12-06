-- Nvim Auto Commands
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc", "http" },
    callback = function()
        vim.opt.conceallevel = 0
    end,
})
