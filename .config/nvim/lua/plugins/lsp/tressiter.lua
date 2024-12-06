-- This file is used to configure the nvim-treesitter plugin
return {
    "nvim-treesitter/nvim-treesitter",

    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "python",
            "javascript",
            "typescript",
            "tsx",
            "vim",
            "css",
            "scss",
            "sql",
            "json",
            "jsonc",
            "xml",
            "html",
            "markdown",
            "markdown_inline",
            "gitignore",
            "gitattributes",
            "yaml",
            "toml",
        },

        query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { "BufWrite", "CursorHold" },
        },
    },
}
