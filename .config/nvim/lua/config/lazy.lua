local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            opts = {
                colorscheme = "kanagawa",
            },
        },

        { import = "lazyvim.plugins.extras.util.dot" },
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

        { import = "lazyvim.plugins.extras.ui.mini-indentscope" },

        { import = "lazyvim.plugins.extras.editor.inc-rename" },

        { import = "lazyvim.plugins.extras.coding.luasnip" },
        { import = "lazyvim.plugins.extras.coding.copilot" },
        { import = "lazyvim.plugins.extras.coding.copilot-chat" },

        { import = "lazyvim.plugins.extras.linting.eslint" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },

        { import = "lazyvim.plugins.extras.lang.markdown" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.yaml" },
        { import = "lazyvim.plugins.extras.lang.toml" },
        { import = "lazyvim.plugins.extras.lang.sql" },

        { import = "lazyvim.plugins.extras.lang.clangd" },
        { import = "lazyvim.plugins.extras.lang.haskell" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.tailwind" },
        { import = "lazyvim.plugins.extras.lang.omnisharp" },

        { import = "lazyvim.plugins.extras.dap.core" },
        { import = "lazyvim.plugins.extras.test.core" },

        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    checker = { enabled = true, notify = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
