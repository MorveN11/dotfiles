-- Mason Language Servers
return {
    "williamboman/mason.nvim",

    opts = function(_, opts)
        vim.list_extend(opts.ensure_installed, {
            "luacheck",
            "shellcheck",
            "shfmt",
            "tailwindcss-language-server",
            "typescript-language-server",
            "css-lsp",
            "xmlformatter",
        })
    end,
}
