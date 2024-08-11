-- Markdown Preview

return {
    "iamcco/markdown-preview.nvim",

    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

    build = "cd app && npm install && rm -f package-lock.json && git restore .",

    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,

    ft = { "markdown" },
}
