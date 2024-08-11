-- Lazy git plugin configuration

return {
    "kdheepak/lazygit.nvim",

    keys = {
        {
            ";c",
            ":LazyGit<Return>",
            silent = true,
            noremap = true,
            desc = "Open lazygit in a floating window",
        },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
